import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/common/errors/folder_exception.dart';
import '../../../../../core/db/objectbox.dart';
import '../../../../../objectbox.g.dart';
import '../../../../embeddings/business/repository_interfaces/embeddings_repository.dart';
import '../../models/folder_model.dart';
import '../dto/folder_create_dto.dart';
import '../dto/folder_dto.dart';
import '../dto/folder_update_dto.dart';
import '../folder_datasource.dart';

class FolderDatasourceLocal implements FolderDataSource {
  final _store = GetIt.I<ObjectBox>().store;
  final _folderBox = GetIt.I<ObjectBox>().store.box<Folder>();
  final _embeddingsRepository = GetIt.I.get<EmbeddingsRepository>();

  final _folders = BehaviorSubject<List<FolderDto>>.seeded([]);

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
    final dbFolderChanges =
        _folderBox.query().watch().map((query) => query.find());

    _foldersChangesSubscription = dbFolderChanges
        .map(
          (folders) =>
              folders.map((folder) => FolderDto.fromModel(folder)).toList(),
        )
        .listen((folders) => _folders.add(folders));
  }

  @override
  Stream<List<FolderDto>> get folders => _folders.stream;

  @override
  Future<List<FolderDto>> getPathTo(int folderId) async {
    return _store.runInTransaction(
      TxMode.read,
      () {
        final List<Folder> path = [];
        Folder? current = _folderBox.get(folderId);

        while (current != null) {
          path.add(current);

          if (current.parent.targetId == 0) {
            break;
          }

          current = current.parent.target;
        }

        final result = path.reversed.toList();

        return result.map((folder) => FolderDto.fromModel(folder)).toList();
      },
    );
  }

  @override
  Future<int> createFolder(FolderCreateDto createFolderDto) async {
    final nameEmbeddings =
        await _embeddingsRepository.getEmbeddingForText(createFolderDto.name);

    final folderModel = Folder(
      name: createFolderDto.name,
      embeddings: nameEmbeddings.embeddings,
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
    return _store.runInTransaction(
      TxMode.write,
      () {
        var folder = _store.box<Folder>().get(folderUpdateDto.id);

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

  void dispose() {
    _folders.close();
    _foldersChangesSubscription.cancel();
  }
}
