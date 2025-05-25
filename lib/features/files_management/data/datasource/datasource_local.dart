import 'dart:async';

import '../../../../core/errors/file_exception.dart';
import '../../../../core/errors/folder_exception.dart';
import '../../../../objectbox.g.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../models/file_model.dart';
import '../../../folders_management/data/models/folder_model.dart';
import '../datasource_interfaces/datasource.dart';
import '../translators/to_dto.dart';
import '../translators/to_model.dart';

class FileDatasourceLocal implements FileDataSource {
  static const rootFolderId = 1; //TODO retrieve from box
  final Store _store;
  late final _fileBox = _store.box<File>();
  late final _folderBox = _store.box<Folder>();

  FileDatasourceLocal(Store store): _store = store;

  @override
  Stream get fileChanges => _fileBox.query().watch();

  @override
  Future<Set<FileDto>> getFilteredFiles(
    int? parentFolderId,
    bool onlyFavourites,
    bool includeFromSubfolders,
  ) async {
    final parentFolder =
        await _folderBox.getAsync(parentFolderId ?? rootFolderId);

    if (parentFolder == null) return {};

    final Set<Folder> acceptableFolders = includeFromSubfolders
        ? {parentFolder, ...(await _getAllDeeplyNestedFolders(parentFolder))}
        : {parentFolder};

    final Set<File> filteredFiles = acceptableFolders
        .expand((folder) => folder.assignedFiles)
        .where((file) => onlyFavourites ? file.isFavourite : true)
        .toSet();

    return filteredFiles.map((file) => file.toDto()).toSet();
  }

  @override
  Future<List<FileDto>> getFiles(List<int> fileIds) async {
    final files = await _fileBox.query(File_.id.oneOf(fileIds)).build().findAsync();

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
      FileCreateDto createFileDto, int? parentFolderId) async {
    final fileModel = createFileDto.toModel();

    final newFileId = await _fileBox.putAsync(fileModel);

    await assignFileToFolder(newFileId, parentFolderId ?? rootFolderId);

    return newFileId;
  }

  @override
  Future<void> createFiles(List<FileCreateDto> createFileDtos) async {
    final fileModels =
        createFileDtos.map((fileDto) => fileDto.toModel()).toList();

    await _fileBox.putManyAsync(fileModels);
  }

  @override
  Future<void> deleteFile(int id) async {
    await _fileBox.removeAsync(id);
  }

  @override
  Future<void> assignFileToFolder(int fileId, int folderId) async {
    return _store.runInTransaction(
      TxMode.write,
      () {
        final folder = _folderBox.get(folderId);
        final file = _fileBox.get(fileId);

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
}

