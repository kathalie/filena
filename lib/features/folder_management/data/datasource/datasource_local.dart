import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../../core/errors/folder_exception.dart';
import '../../../../objectbox.g.dart';
import '../../../file_management/data/models/file_in_folder_model.dart';
import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../dto/folder_create_dto.dart';
import '../dto/folder_dto.dart';
import '../dto/folder_update_dto.dart';
import '../models/folder_model.dart';
import '../datasource_interfaces/datasource.dart';
import '../translators/to_dto.dart';

class FolderDatasourceLocal implements FolderDataSource {
  final Store _store;
  late final _folderBox = _store.box<Folder>();
  late final _fileInFolderBox = _store.box<FileInFolder>();
  late final _folderSuggestionBox = _store.box<FolderSuggestion>();

  FolderDatasourceLocal(Store store) : _store = store;

  @override
  // Stream get folderChanges => _folderBox.query().watch();
  Stream get folderChanges {
    final fileInFolderStream = _fileInFolderBox.query().watch();
    final folderStream = _folderBox.query().watch();

    return Rx.combineLatest2(
      fileInFolderStream,
      folderStream,
          (fileInFolderSnapshot, folderSnapshot) {
        return _folderBox.getAll();
      },
    );
  }

  @override
  Future<List<FolderDto>> get allFolders async {
    final folders = await _store.runInTransactionAsync<List<Folder>, void>(
      TxMode.read,
      (Store store, void _) {
        final folderBox = Box<Folder>(store);
        return folderBox.getAll();
      },
      null,
    );

    return folders.map((folder) => folder.toDto()).toList();
  }

  @override
  Future<FolderDto> get rootFolder async {
    final rootFolder = await _store.runInTransactionAsync<Folder, void>(
      TxMode.read,
      (Store store, void _) {
        final folderBox = Box<Folder>(store);

        final rootFolder =
            folderBox.query(Folder_.parentFolder.equals(0)).build().findFirst();

        if (rootFolder == null) {
          throw FolderException.folderDoesNotExist(
            title: 'Root folder is not found.',
          );
        }

        return rootFolder;
      },
      null,
    );

    return rootFolder.toDto();
  }

  @override
  Future<List<FolderDto>> getPathTo(int? folderId) async {
    final rootFolder = await this.rootFolder;

    if (folderId == null) return [rootFolder];

    return _store.runInTransaction(
      TxMode.read,
      () {
        final List<Folder> path = [];
        Folder? current = _folderBox.get(folderId);

        if (current == null) return [rootFolder];

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

        folder.name = folderUpdateDto.name;
        folder.embeddings = folderUpdateDto.embeddings;

        _folderBox.put(folder);
      },
    );
  }

  @override
  Future<void> deleteFolderWithChildren(int id) async {
    if (await _isRootFolder(id)) {
      throw FolderException.failedToDeleteFolder(
        folderName: 'All',
        explanation: 'Deletion of a root folder is forbidden.',
      );
    }

    final folderToDelete = _folderBox.get(id);

    if (folderToDelete == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Failed to delete a folder',
      );
    }

    final childrenIds =
        folderToDelete.allNestedFolders.map((folder) => folder.id).toList();
    final folderIdsToDelete = [id, ...childrenIds];

    print('Removing folders with ids: $folderIdsToDelete');

    await _removeFolderAssignments(folderIdsToDelete);
    await _removeFolderSuggestions(folderIdsToDelete);
    await _folderBox.removeManyAsync(folderIdsToDelete);
  }

  Future<bool> _isRootFolder(int folderId) async {
    return (await rootFolder).id == folderId;
  }

  Future<void> _removeFolderAssignments(List<int> folderIds) async {
    final fileInFolderIdsToRemove = await (_fileInFolderBox.query()
          ..link(FileInFolder_.assignedFolder, Folder_.id.oneOf(folderIds)))
        .build()
        .findIdsAsync();

    print('Removed file assignments: $fileInFolderIdsToRemove');

    await _fileInFolderBox.removeManyAsync(fileInFolderIdsToRemove);
  }

  Future<void> _removeFolderSuggestions(List<int> folderIds) async {
    final folderSuggestionIdsToRemove = await (_folderSuggestionBox.query()
      ..link(FolderSuggestion_.folder, Folder_.id.oneOf(folderIds)))
        .build()
        .findIdsAsync();

    print('Removed folder suggestions: $folderSuggestionIdsToRemove');

    await _folderSuggestionBox.removeManyAsync(folderSuggestionIdsToRemove);
  }
}
