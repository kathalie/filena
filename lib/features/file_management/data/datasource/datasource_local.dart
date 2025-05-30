import 'dart:async';

import '../../../../core/errors/file_exception.dart';
import '../../../../core/errors/folder_exception.dart';
import '../../../../objectbox.g.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../models/file_model.dart';
import '../../../folder_management/data/models/folder_model.dart';
import '../datasource_interfaces/datasource.dart';
import '../translators/to_dto.dart';
import '../translators/to_model.dart';

class FileDatasourceLocal implements FileDataSource {
  final Store _store;
  late final _fileBox = _store.box<File>();
  late final _folderBox = _store.box<Folder>();

  FileDatasourceLocal(Store store) : _store = store;

  @override
  Stream get fileChanges => _fileBox.query().watch();

  @override
  Future<Set<FileDto>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  ) async {
    final parentFolder = await _folderBox.getAsync(parentFolderId);

    if (parentFolder == null) return {};

    final Set<Folder> acceptableFolders = includeFromSubfolders
        ? {parentFolder, ...(await _getAllDeeplyNestedFolders(parentFolder))}
        : {parentFolder};

    final Set<File> filteredFiles = acceptableFolders
        .expand((folder) => folder.assignedFiles)
        .where((file) => onlyPrioritized ? file.isPrioritized : true)
        .toSet();

    return filteredFiles.map((file) => file.toDto()).toSet();
  }

  @override
  Future<List<FileDto>> getFiles(List<int> fileIds) async {
    final files =
        await _fileBox.query(File_.id.oneOf(fileIds)).build().findAsync();

    return files.map((file) => file.toDto()).toList();
  }

  Future<Set<Folder>> _getAllDeeplyNestedFolders(Folder parentFolder) async {
    Set<int> collectNestedIds(Folder folder) {
      return {
        ...folder.nestedFolders.map((child) => child.id),
        ...folder.nestedFolders.expand(collectNestedIds),
      };
    }

    final nestedFoldersIds = collectNestedIds(parentFolder).toList();

    final isInFoldersQuery =
        _folderBox.query(Folder_.id.oneOf(nestedFoldersIds)).build();

    return isInFoldersQuery.find().toSet();
  }

  @override
  Future<int> createFile(
    FileCreateDto createFileDto,
    int parentFolderId,
  ) async {
    final fileModel = createFileDto.toModel();

    final newFileId = await _fileBox.putAsync(fileModel);

    final newFile = _fileBox.get(newFileId)!;

    await assignFileToFolder(newFile.id, parentFolderId);

    return newFileId;
  }

  @override
  Future<void> createFiles(List<FileCreateDto> createFileDtos) async {
    final fileModels =
        createFileDtos.map((fileDto) => fileDto.toModel()).toList();

    await _fileBox.putManyAsync(fileModels);
  }

  @override
  Future<void> deleteFile(int fileId) async {
    final fileToRemove = await
        _fileBox.getAsync(fileId);

    if (fileToRemove == null) {
      throw FileException.fileDoesNotExist(
        title: 'Failed to delete a file',
      );
    }

    await _fileBox.removeAsync(fileToRemove.id);
  }

  @override
  Future<void> assignFileToFolder(int fileId, int folderId) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
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

        final updatedFile = file..parentFolders.add(folder);

        _fileBox.put(updatedFile);
      },
    );
  }

  @override
  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
        final folder = _folderBox.get(folderId);

        if (folder == null) {
          throw FolderException.folderDoesNotExist(
            title: 'Failed to assign file to a folder',
          );
        }

        folder.assignedFiles.removeWhere((file) => fileIds.contains(file.id));

        _folderBox.put(folder);
      },
    );
  }
}
