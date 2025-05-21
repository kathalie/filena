import '../../business/repository_interfaces/folder_repository.dart';
import '../../domain/entities/folder_entity.dart';
import '../../domain/structures/folder_tree.dart';
import '../datasource/dto/folder_create_dto.dart';
import '../datasource/dto/folder_dto.dart';
import '../datasource/dto/folder_update_dto.dart';
import '../datasource/folder_datasource.dart';

class FolderRepositoryImpl implements FolderRepository {
  final FolderDataSource folderDataSource;

  FolderRepositoryImpl(this.folderDataSource);

  @override
  Stream<FolderTreeStructure> get folderStructure =>
      folderDataSource.folders
          .map((folderDtos) => _folderTreeStructureFrom(folderDtos));

  FolderTreeStructure _folderTreeStructureFrom(List<FolderDto> folderDtos) {
    final folderEntities = folderDtos.map((folderDto) {
      return FolderEntity(
        id: folderDto.id,
        name: folderDto.name,
        parentId: folderDto.parentId,
      );
    }).toList();

    return FolderTree.fromList(folderEntities);
  }

  @override
  Future<void> createFolder(int? parentFolderId, String name) async {
    await folderDataSource.createFolder(
      FolderCreateDto(
        name: name,
        parentFolderId: parentFolderId,
        needsConfirmation: false,
      ),
    );
  }

  @override
  Future<void> deleteFolder(int folderId) async {
    await folderDataSource.deleteFolder(folderId);
  }

  @override
  Future<void> updateFolder(int folderId, String newName) async {
    await folderDataSource.updateFolder(
      FolderUpdateDto(
        id: folderId,
        name: newName,
      ),
    );
  }
}
