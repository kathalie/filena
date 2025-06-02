import 'dart:async';

import 'package:objectbox/objectbox.dart';

import '../../../../core/errors/file_exception.dart';
import '../../../../core/errors/folder_exception.dart';
import '../../../../objectbox.g.dart';
import '../../../organizing_assistant/data/models/folder_suggestion_model.dart';
import '../../common/helpers/file_category.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../models/file_in_folder_model.dart';
import '../models/file_model.dart';
import '../../../folder_management/data/models/folder_model.dart';
import '../datasource_interfaces/datasource.dart';
import '../translators/to_dto.dart';
import '../translators/to_model.dart';

class FileDatasourceLocal implements FileDataSource {
  final Store _store;
  late final _fileBox = _store.box<File>();
  late final _folderBox = _store.box<Folder>();
  late final _fileInFolderBox = _store.box<FileInFolder>();
  late final _folderSuggestionBox = _store.box<FolderSuggestion>();

  FileDatasourceLocal(Store store) : _store = store;

  @override
  Stream get fileChanges => _fileBox.query().watch();

  @override
  Stream get fileInFolderChanges => _fileInFolderBox.query().watch();

  @override
  Future<Set<FileDto>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  ) async {
    final parentFolder = await _folderBox.getAsync(parentFolderId);

    if (parentFolder == null) return {};

    final Set<Folder> acceptableFolders = includeFromSubfolders
        ? {parentFolder, ...parentFolder.allNestedFolders}
        : {parentFolder};

    final Set<File> filteredFiles = acceptableFolders
        .expand((folder) => folder.fileAssignments)
        .map((fileInFolder) => fileInFolder.assignedFile.target!)
        .where((file) => onlyPrioritized ? file.isPrioritized : true)
        .toSet();

    return filteredFiles.map((file) => file.toDto()).toSet();
  }

  @override
  Future<List<FileDto>> getUnclassifiedFiles(
    FileCategory? category,
    bool onlyPrioritized,
  ) async {
    final files = _fileBox
        .query(_getUnclassifiedCondition(category, onlyPrioritized))
        .build()
        .find();

    return files.map((file) => file.toDto()).toList();
  }

  Condition<File> _getUnclassifiedCondition(
    FileCategory? category,
    bool onlyPrioritized,
  ) {
    var filterUnclassifiedCondition = File_.folderAssignments.relationCount(1);
    if (onlyPrioritized) {
      filterUnclassifiedCondition =
          filterUnclassifiedCondition.and(File_.isPrioritized.equals(true));
    }

    // All unclassified
    if (category == null) return filterUnclassifiedCondition;

    // Unclassified of a specific category type
    return filterUnclassifiedCondition
        .and(File_.categoryId.equals(category.index));
  }

  @override
  Future<List<FileDto>> getFiles(List<int> fileIds) async {
    final files =
        await _fileBox.query(File_.id.oneOf(fileIds)).build().findAsync();

    return files.map((file) => file.toDto()).toList();
  }

  @override
  Future<List<int>> getParentFolderIds(int fileId) async {
    final file = _fileBox.get(fileId);

    if (file == null) {
      throw FileException.fileDoesNotExist(
          title: 'Failed to get parent folders');
    }

    return file.folderAssignments
        .map((f) => f.assignedFolder.targetId)
        .toList();
  }

  @override
  Future<int> createFile(
    FileCreateDto createFileDto,
    int parentFolderId,
  ) async {
    final fileModel = createFileDto.toModel();

    return await _store.runInTransaction(TxMode.write, () {
      final newFileId = _fileBox.put(fileModel);

      final newFile = _fileBox.get(newFileId)!;

      _assignFileToFolder(newFile.id, parentFolderId);

      return newFileId;
    });
  }

  void _assignFileToFolder(int fileId, int folderId) {
    final folder = _folderBox.get(folderId);
    final file = _fileBox.query(File_.id.equals(fileId)).build().findFirst();

    if (folder == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Failed to assign file to a folder',
      );
    }

    if (file == null) {
      throw FileException.fileDoesNotExist(
        title: 'Failed to assign file to a folder',
      );
    }

    final fileInFolder = FileInFolder();
    fileInFolder.assignedFile.target = file;
    fileInFolder.assignedFolder.target = folder;

    print('Creating fileInFolder ${fileInFolder.id}');

    _fileInFolderBox.put(fileInFolder);
  }

  @override
  Future<void> assignFileToFolder(int fileId, int folderId) async {
    _store.runInTransaction(TxMode.write, () {
      _assignFileToFolder(fileId, folderId);
    });
  }

  @override
  Future<void> togglePrioritized(int fileId) async {
    _store.runInTransaction(TxMode.write, () {
      final file = _fileBox.get(fileId);

      if (file == null) {
        throw FileException.fileDoesNotExist(
          title: 'Failed to change priority for a file',
        );
      }

      file.isPrioritized = !file.isPrioritized;

      _fileBox.put(file);
    });
  }

  @override
  Future<void> renameFile(int fileId, String newName) async {
    _store.runInTransaction(TxMode.write,
        () {
      final file = _fileBox.get(fileId);

      if (file == null) {
        throw FileException.fileDoesNotExist(
          title: 'Failed to rename a file',
        );
      }

      file.name = newName;

      _fileBox.put(file);
    });
  }

  @override
  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId) async {
    _store.runInTransaction(TxMode.write,
        () {
      final folder = _folderBox.get(folderId);

      if (folder == null) {
        throw FolderException.folderDoesNotExist(
          title: 'Failed to assign file to a folder',
        );
      }

      final List<int> fileInFolderIds = [];
      for (final fileId in fileIds) {
        final ids = _fileInFolderBox
            .query(
              FileInFolder_.assignedFolder
                  .equals(folderId)
                  .and(FileInFolder_.assignedFile.equals(fileId)),
            )
            .build()
            .findIds();
        fileInFolderIds.addAll(ids);
      }

      _fileInFolderBox.removeMany(fileInFolderIds);
    });
  }

  @override
  Future<void> deleteFile(int fileId) async {
    _store.runInTransaction(TxMode.write,
        () {
      _removeFileAssignments(fileId);
      _removeFromFolderSuggestions(fileId);

      _fileBox.remove(fileId);
    });
  }

  void _removeFileAssignments(int fileId) {
    final fileInFolderIdsToRemove = _fileInFolderBox
        .query(FileInFolder_.assignedFile.equals(fileId))
        .build()
        .findIds();

    print('Removing folder assignments with ids: $fileInFolderIdsToRemove');

    _fileInFolderBox.removeMany(fileInFolderIdsToRemove);
  }

  void _removeFromFolderSuggestions(int fileId) {
    final folderSuggestions = (_folderSuggestionBox.query()
          ..linkMany(FolderSuggestion_.files, File_.id.equals(fileId)))
        .build()
        .find();

    for (final folderSuggestion in folderSuggestions) {
      print('Removing from folder suggestion with id: ${folderSuggestion.id}');

      folderSuggestion.files.removeWhere((file) => file.id == fileId);

      if (folderSuggestion.files.isEmpty) {
        _folderSuggestionBox.remove(folderSuggestion.id);
      } else {
        _folderSuggestionBox.put(folderSuggestion);
      }
    }
  }
}
