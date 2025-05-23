import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/common/const.dart';
import '../../../../../core/common/errors/file_exception.dart';
import '../../../../../core/common/errors/folder_exception.dart';
import '../../../../../core/db/objectbox.dart';
import '../../../../../objectbox.g.dart';
import '../../models/file_model.dart';
import '../../models/folder_model.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';
import '../file_datasource.dart';

class FileDatasourceLocal implements FileDataSource {
  final _store = GetIt.I<ObjectBox>().store;
  final _folderBox = GetIt.I<ObjectBox>().store.box<Folder>();
  final _fileBox = GetIt.I<ObjectBox>().store.box<File>();

  final _fileChanges = BehaviorSubject<Query<File>>();
  late final StreamSubscription<Query<File>> _filesChangesSubscription;

  FileDatasourceLocal() {
    _initSubscription();
  }

  void _initSubscription() {
    final dbFilesChanges = _fileBox.query().watch();

    _filesChangesSubscription =
        dbFilesChanges.listen((query) => _fileChanges.add(query));
  }

  @override
  Stream get fileChanges => _fileChanges.stream;

  @override
  Future<Set<FileDto>> getFilteredFiles(
    int? parentFolderId,
    bool onlyFavourites,
    bool includeFromSubfolders,
  ) async {
    final parentFolder = await _folderBox.getAsync(parentFolderId ?? rootFolderId);

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

  Future<Set<Folder>> _getAllDeeplyNestedFolders(Folder parentFolder) async {
    Set<int> collectNestedIds(Folder folder) {
      return {
        ...folder.children.map((child) => child.id),
        ...folder.children.expand(collectNestedIds),
      };
    }

    final nestedFoldersIds = collectNestedIds(parentFolder).toList();

    final isInFoldersQuery =
        _folderBox.query(Folder_.id.oneOf(nestedFoldersIds)).build();

    return isInFoldersQuery.find().toSet();
  }

  @override
  Future<int> createFile(FileCreateDto createFileDto, int? parentFolderId) async {
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

  void dispose() {
    _filesChangesSubscription.cancel();
  }
}

extension on FileCreateDto {
  File toModel() {
    return File(
      name: name,
      hash: hash,
      mimeType: mimeType,
      isFavourite: false,
      embeddings: embeddings,
    );
  }
}

extension on File {
  FileDto toDto() {
    return FileDto(
      id: id,
      name: name,
      mimeType: mimeType,
      isFavourite: isFavourite,
    );
  }
}
