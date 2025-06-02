import 'dart:async';

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
  Stream get folderChanges => _folderBox.query().watch();

  @override
  Future<List<FolderDto>> get allFolders async {
    final folders = await _store.runInTransactionAsync<List<Folder>, void>(
        TxMode.read, (Store store, void _) {
      final folderBox = Box<Folder>(store);
      return folderBox.getAll();
    }, null);

    return folders.map((folder) => folder.toDto()).toList();
  }

  @override
  Future<FolderDto> get rootFolder async {
    final rootFolder =
        _folderBox.query(Folder_.parentFolder.equals(0)).build().findFirst();

    if (rootFolder == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Root folder is not found.',
      );
    }

    return rootFolder.toDto();
  }

  @override
  Future<List<FolderDto>> getPathTo(int? folderId) async {
    final rootFolder = await this.rootFolder;

    if (folderId == null) return [rootFolder];

    final List<Folder> path = [];
    Folder? current = await _folderBox.getAsync(folderId);

    if (current == null) return [rootFolder];

    while (current != null) {
      path.add(current);

      if (current.parentFolder.target == null) break;

      current = current.parentFolder.target;
    }

    final result = path.reversed.toList();

    return result.map((folder) => folder.toDto()).toList();
  }

  @override
  Future<int> createFolder(FolderCreateDto createFolderDto) async {
    final folderModel = Folder(
      name: createFolderDto.name,
      embeddings: createFolderDto.embeddings,
    );
    final int parentFolderId =
        createFolderDto.parentFolderId ?? (await rootFolder).id;

    return _store.runInTransaction(TxMode.write, () {
      final parentFolder = _folderBox.get(parentFolderId);

      folderModel.parentFolder.target = parentFolder;

      _folderBox.put(folderModel);

      return folderModel.id;
    });
  }

  @override
  Future<FolderDto?> getFolder(int id) async {
    final folder = _folderBox.get(id);

    return folder?.toDto();
  }

  @override
  Future<void> updateFolder(FolderUpdateDto folderUpdateDto) async {
    _store.runInTransaction(TxMode.write, () {
      var folder = _folderBox.get(folderUpdateDto.id);

      if (folder == null) {
        throw FolderException.failedToRenameFolder(
          explanation: 'This folder does not exist',
        );
      }

      folder.name = folderUpdateDto.name;
      folder.embeddings = folderUpdateDto.embeddings;

      _folderBox.put(folder);
    });
  }

  @override
  Future<void> deleteFolderWithChildren(int id) async {
    if (await _isRootFolder(id)) {
      throw FolderException.failedToDeleteFolder(
        folderName: 'All',
        explanation: 'Deletion of a root folder is forbidden.',
      );
    }

    _store.runInTransaction(TxMode.write, () {
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

      _removeFolderAssignments(folderIdsToDelete);
      _removeFolderSuggestions(folderIdsToDelete);
      _folderBox.removeMany(folderIdsToDelete);
    });
  }

  Future<bool> _isRootFolder(int folderId) async {
    return (await rootFolder).id == folderId;
  }

  void _removeFolderAssignments(List<int> folderIds) {
    final fileInFolderIdsToRemove = (_fileInFolderBox.query()
          ..link(FileInFolder_.assignedFolder, Folder_.id.oneOf(folderIds)))
        .build()
        .findIds();

    print('Removed file assignments: $fileInFolderIdsToRemove');

    _fileInFolderBox.removeMany(fileInFolderIdsToRemove);
  }

  void _removeFolderSuggestions(List<int> folderIds) {
    final folderSuggestionIdsToRemove = (_folderSuggestionBox.query()
          ..link(FolderSuggestion_.folder, Folder_.id.oneOf(folderIds)))
        .build()
        .findIds();

    print('Removed folder suggestions: $folderSuggestionIdsToRemove');

    _folderSuggestionBox.removeMany(folderSuggestionIdsToRemove);
  }
}
