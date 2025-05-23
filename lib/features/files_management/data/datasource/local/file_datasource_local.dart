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

  final _filteredFiles = BehaviorSubject<List<FileDto>>.seeded([]);
  final _parentIdFilter = BehaviorSubject<int?>.seeded(null);
  final _onlyFavouritesFilter = BehaviorSubject<bool>.seeded(false);
  final _includeSubfolderFilesFilter = BehaviorSubject<bool>.seeded(false);

  late final StreamSubscription<List<FileDto>> _changesSubscription;

  FileDatasourceLocal() {
    final initialFiles = _applyFilters(
      _parentIdFilter.value,
      _onlyFavouritesFilter.value,
      _includeSubfolderFilesFilter.value,
    ).map((file) => file.toDto()).toList();

    _fileBox.getAll().map((file) => file.toDto()).toList();

    _filteredFiles.add(initialFiles);

    _initSubscription();
  }

  void _initSubscription() {
    final dbFileChanges = _fileBox.query().watch().map((query) => query.find());

    Rx.combineLatest4(
      dbFileChanges,
      _parentIdFilter,
      _onlyFavouritesFilter,
      _includeSubfolderFilesFilter,
      (_, parentId, onlyFavorites, includeSubfolders) => _applyFilters(
        parentId,
        onlyFavorites,
        includeSubfolders,
      ),
    )
        .map(
          (file) => file.map((file) => file.toDto()).toList(),
        )
        .listen((filteredFiles) => _filteredFiles.add(filteredFiles));
  }

  List<File> _applyFilters(
    int? parentId,
    bool onlyFavorites,
    bool includeSubfolders,
  ) {
    final parentFolderId = parentId ?? 0;

    final acceptableFolders =
        _acceptableParentFolders(parentFolderId, includeSubfolders);

    final Set<File> filteredFiles = acceptableFolders
        .expand((folder) => folder.assignedFiles)
        .where((file) => onlyFavorites ? file.isFavourite : true)
        .toSet();

    return filteredFiles.toList();
  }

  List<Folder> _acceptableParentFolders(
    int parentId,
    bool includeSubfolders,
  ) {
    final List<int> folderIds = [
      parentId,
      ...(includeSubfolders ? _nestedFolderIds(parentId) : []),
    ];

    final isInFoldersQuery =
        _folderBox.query(Folder_.id.oneOf(folderIds)).build();

    final acceptableFolders =
        folderIds.isEmpty ? _folderBox.getAll() : isInFoldersQuery.find();

    return acceptableFolders;
  }

  Set<int> _nestedFolderIds(int parentFolderId) {
    final Folder? parentFolder = _folderBox.get(parentFolderId);

    if (parentFolder == null) return {};

    Set<int> collectNestedIds(Folder folder) {
      return {
        ...folder.children.map((child) => child.id),
        ...folder.children.expand(collectNestedIds),
      };
    }

    return collectNestedIds(parentFolder);
  }

  @override
  Stream<List<FileDto>> get filteredFiles => _filteredFiles.stream;

  @override
  void setParentFolderFilter(int? parentFolderId) {
    _parentIdFilter.add(parentFolderId);
  }

  @override
  void setOnlyFavouritesFilter(bool onlyFavourites) {
    _onlyFavouritesFilter.add(onlyFavourites);
  }

  @override
  void setIncludeSubfoldersFilter(bool includeFromSubfolders) {
    _includeSubfolderFilesFilter.add(includeFromSubfolders);
  }

  @override
  Future<int> createFile(FileCreateDto createFileDto) async {
    final fileModel = createFileDto.toModel();

    final newFileId = await _fileBox.putAsync(fileModel);
    final newFile = _fileBox.get(newFileId);

    final parentFolder =
        _folderBox.get(createFileDto.parentFolderId ?? rootFolderId);
    if (parentFolder == null) {
      throw FolderException.folderDoesNotExist(
        title: 'Failed to save file to a root folder.',
      );
    }
    if (newFile == null) {
      throw FileException.fileDoesNotExist(
        title: 'Failed to save file to a root folder.',
      );
    }

    parentFolder.assignedFiles.add(newFile);
    _folderBox.put(parentFolder);

    return fileModel.id;
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
        final folder = _store.box<Folder>().get(folderId);
        final file = _store.box<File>().get(fileId);

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

        _store.box<File>().put(updatedFile);
      },
    );
  }

  void dispose() {
    _filteredFiles.close();
    _onlyFavouritesFilter.close();
    _parentIdFilter.close();
    _includeSubfolderFilesFilter.close();
    _changesSubscription.cancel();
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
