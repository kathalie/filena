import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../core/common/const.dart';
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

  //TODO come up with proper communication between features
  final _embeddingsRepository = GetIt.I.get<EmbeddingsRepository>();

  final _folderChanges = BehaviorSubject<Query<Folder>>();
  late final StreamSubscription<Query<Folder>> _foldersChangesSubscription;

  FolderDatasourceLocal() {
    _initSubscription();
  }

  void _initSubscription() {
    final dbFolderChanges = _folderBox.query().watch();

    _foldersChangesSubscription =
        dbFolderChanges.listen((query) => _folderChanges.add(query));
  }

  @override
  Stream get folderChanges =>_folderChanges.stream;

  @override
  Future<List<FolderDto>> get allFolders async {
    final folderDtos = await _folderBox
        .query(Folder_.id.notEquals(rootFolderId))
        .build()
        .findAsync();

    return folderDtos.map((folder) => folder.toDto()).toList();
  }

  @override
  Future<List<FolderDto>> getPathTo(int? folderId) async {
    return _store.runInTransaction(
      TxMode.read,
          () {
        final List<Folder> path = [];
        Folder? current = _folderBox.get(folderId ?? rootFolderId);

        while (current != null) {
          path.add(current);

          if (current.parent.targetId == rootFolderId) break;

          current = current.parent.target;
        }

        final result = path.reversed.toList();

        return result.map((folder) => folder.toDto()).toList();
      },
    );
  }

  @override
  Future<int> createFolder(FolderCreateDto createFolderDto) async {
    final nameEmbeddings =
    await _embeddingsRepository.getEmbeddingsForText(createFolderDto.name);

    final folderModel = Folder(
      name: createFolderDto.name,
      embeddings: nameEmbeddings.embeddings,
    );

    final int parentFolderId = createFolderDto.parentFolderId ?? rootFolderId;
    final parentFolder = _folderBox.get(parentFolderId);

    folderModel.parent.target = parentFolder;

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
    _folderChanges.close();
    _foldersChangesSubscription.cancel();
  }
}

extension on Folder {
  FolderDto toDto() {
    return FolderDto(id: id, name: name, parentId: parent.targetId);
  }
}
