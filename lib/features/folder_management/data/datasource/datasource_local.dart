import 'dart:async';

import '../../../../core/errors/folder_exception.dart';
import '../../../../objectbox.g.dart';
import '../dto/folder_create_dto.dart';
import '../dto/folder_dto.dart';
import '../dto/folder_update_dto.dart';
import '../models/folder_model.dart';
import '../datasource_interfaces/datasource.dart';
import '../translators/to_dto.dart';

class FolderDatasourceLocal implements FolderDataSource {
  final Store _store;
  late final _folderBox = _store.box<Folder>();

  FolderDatasourceLocal(Store store) : _store = store;

  @override
  Stream get folderChanges => _folderBox.query().watch();

  @override
  Future<List<FolderDto>> get allFolders async {
    final folders = await _folderBox.getAllAsync();

    return folders.map((folder) => folder.toDto()).toList();
  }

  @override
  Future<FolderDto> get rootFolder async {
    final rootFolder = await _folderBox
        .query(Folder_.parentFolder.equals(0))
        .build()
        .findFirstAsync();

    if (rootFolder == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Root folder is not found.',
      );
    }

    return rootFolder.toDto();
  }

  @override
  Future<List<FolderDto>> getPathTo(int? folderId) async {
    if (folderId == null) return [];

    return _store.runInTransaction(
      TxMode.read,
      () {
        final List<Folder> path = [];
        Folder? current = _folderBox.get(folderId);

        while (current != null) {
          path.add(current);

          if (current.parentFolder.target == null) break;

          current = current.parentFolder.target;
        }

        final result = path.reversed.toList();

        return result.map((folder) => folder.toDto()).toList();
      },
    );
  }

  @override
  Future<int> createFolder(FolderCreateDto createFolderDto) async {
    final folderModel = Folder(
      name: createFolderDto.name,
      embeddings: createFolderDto.embeddings,
    );

    final int parentFolderId =
        createFolderDto.parentFolderId ?? (await rootFolder).id;
    final parentFolder = _folderBox.get(parentFolderId);

    folderModel.parentFolder.target = parentFolder;

    await _folderBox.putAsync(folderModel);

    return folderModel.id;
  }

  @override
  Future<FolderDto?> getFolder(int id) async {
    final folder = await _folderBox.getAsync(id);

    return folder?.toDto();
  }

  @override
  Future<void> updateFolder(FolderUpdateDto folderUpdateDto) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
        var folder = _folderBox.get(folderUpdateDto.id);

        if (folder == null) {
          throw FolderException.failedToRenameFolder(
            explanation: 'This folder does not exist',
          );
        }

        final updatedFolder = folder..name = folderUpdateDto.name;

        _folderBox.put(updatedFolder);
      },
    );
  }

  @override
  Future<void> deleteFolder(int id) async {
    await _folderBox.removeAsync(id);
  }
}
