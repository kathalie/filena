import 'package:rxdart/rxdart.dart';

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
      folderDataSource.folders.map(_folderTreeStructureFrom);

  FolderTreeStructure _folderTreeStructureFrom(List<FolderDto> folderDtos) {
    final folderEntities =
        folderDtos.map((folderDto) => folderDto.toEntity()).toList();

    return FolderTree.fromList(folderEntities);
  }

  final _selectedFolder = BehaviorSubject<FolderEntity?>.seeded(null);

  @override
  void selectFolder(FolderEntity? newFolder) {
    _selectedFolder.add(newFolder);
  }

  @override
  Stream<FolderEntity?> get selectedFolder => _selectedFolder.stream.distinct();

  @override
  Stream<List<FolderEntity>> get pathToSelectedFolder =>
      Rx.combineLatest2<FolderEntity?, List<FolderDto>, FolderEntity?>(
        selectedFolder,
        folderDataSource.folders,
        (folder, _) => folder,
      ).switchMap(
        (folder) => folder == null
            ? Stream.value([])
            : Stream.fromFuture(folderDataSource.getPathTo(folder.id))
                .map((dtoList) => dtoList.toEntities()),
      );

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

extension on FolderDto {
  FolderEntity toEntity() => FolderEntity(
        id: id,
        name: name,
        parentId: parentId,
      );
}

extension on List<FolderDto> {
  List<FolderEntity> toEntities() => map((dto) => dto.toEntity()).toList();
}
