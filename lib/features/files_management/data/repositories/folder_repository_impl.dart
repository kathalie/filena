import '../../business/repository_interfaces/folder_repository.dart';
import '../../domain/entities/folder_entity.dart';
import '../../domain/structures/folder_tree.dart';
import '../datasource/dto/folder_create_dto.dart';
import '../datasource/dto/folder_dto.dart';
import '../datasource/dto/folder_update_dto.dart';
import '../datasource/folder_datasource.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderDataSource _folderDataSource;

  FolderRepositoryImpl(this._folderDataSource);

  @override
  Stream get folderChanges => _folderDataSource.folderChanges;

  @override
  Future<FolderTreeStructure> get folderStructure async {
    final folderDtos = await _folderDataSource.allFolders;

    final folderEntities =
    folderDtos.map((folderDto) => folderDto.toEntity()).toList();

    return FolderTree.fromList(folderEntities);
  }

  @override
  Future<List<FolderEntity>> getPathToFolder(int? folderId) async {
    final folderDtos = await _folderDataSource.getPathTo(folderId);

    return folderDtos.map((folderDto) => folderDto.toEntity()).toList();
  }

  @override
  Future<void> createFolder(int? parentFolderId, String name) async {
    await _folderDataSource.createFolder(
      FolderCreateDto(
        name: name,
        parentFolderId: parentFolderId,
        needsConfirmation: false,
      ),
    );
  }

  @override
  Future<void> deleteFolder(int folderId) async {
    await _folderDataSource.deleteFolder(folderId);
  }

  @override
  Future<void> updateFolder(int folderId, String newName) async {
    await _folderDataSource.updateFolder(
      FolderUpdateDto(
        id: folderId,
        name: newName,
      ),
    );
  }
}

extension on FolderDto {
  FolderEntity toEntity() => FolderEntity(
        id: id,
        name: name,
        parentId: parentId,
      );
}
