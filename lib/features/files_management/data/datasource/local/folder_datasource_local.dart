import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/db/objectbox.dart';
import '../../../../../core/errors/folder_exception.dart';
import '../../../../../objectbox.g.dart';
import '../../models/folder_model.dart';
import '../dto/folder_create_dto.dart';
import '../dto/folder_dto.dart';
import '../dto/folder_update_dto.dart';
import '../folder_datasource.dart';

class FolderDatasourceLocal implements FolderDataSource {
  final _store = GetIt.I<ObjectBox>().store;
  final _folderBox = GetIt.I<ObjectBox>().store.box<Folder>();

  final _folders = BehaviorSubject<List<FolderDto>>.seeded([]);

  @override
  Stream<List<FolderDto>> get folders => _folders.stream;

  late final StreamSubscription<List<FolderDto>> _foldersChangesSubscription;

  FolderDatasourceLocal() {
    final initialFolders = _folderBox
        .getAll()
        .map((folder) => FolderDto.fromModel(folder))
        .toList();

    _folders.add(initialFolders);

    _initSubscription();
  }

  void _initSubscription() {
    _foldersChangesSubscription = _folderBox
        .query()
        .watch()
        .map((query) => query.find())
        .map(
          (folders) =>
              folders.map((folder) => FolderDto.fromModel(folder)).toList(),
        )
        .listen((folders) => _folders.add(folders));
  }

  @override
  Future<int> createFolder(FolderCreateDto createFolderDto) async {
    final folderModel = Folder(
      name: createFolderDto.name,
    );

    if (createFolderDto.parentFolderId != null) {
      final parentFolder = _folderBox.get(createFolderDto.parentFolderId!);

      folderModel.parent.target = parentFolder;
    }

    await _folderBox.putAsync(folderModel);

    return folderModel.id;
  }

  @override
  Future<FolderDto?> getFolder(int id) async {
    final folder = await _folderBox.getAsync(id);

    return folder == null ? null : FolderDto.fromModel(folder);
  }

  @override
  Future<void> updateFolder(FolderUpdateDto folderUpdateDto) async {
    update(Store store, int objectId) {
      var folder = store.box<Folder>().get(objectId);

      if (folder == null) {
        throw FolderException.failedToRenameFolder(
          explanation: 'A folder does not exist',
        );
      }

      final updatedFolder = folder..name = folderUpdateDto.name;

      _folderBox.put(updatedFolder);
    }

    await _store.runInTransactionAsync(
      TxMode.write,
      update,
      folderUpdateDto.id,
    );
  }

  @override
  Future<void> deleteFolder(int id) async {
    await _folderBox.removeAsync(id);
  }

  void dispose() {
    _folders.close();
    _foldersChangesSubscription.cancel();
  }
}
