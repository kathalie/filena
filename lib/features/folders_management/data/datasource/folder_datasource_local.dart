import 'package:get_it/get_it.dart';

import '../../../../core/db/objectbox.dart';
import '../models/folder_model.dart';
import 'dto/create_folder_dto.dart';
import 'dto/folder_dto.dart';
import 'folder_datasource.dart';

class FolderDatasourceLocal implements FolderDataSource {
  final _folderBox = GetIt.I<ObjectBox>().store.box<Folder>();

  @override
  Future<FolderDto> getFolderHierarchy() async {
    // TODO: implement getFolder
    throw UnimplementedError();
  }

  // List<Folder> _getRootFolders() {
  //   final query = _folderBox.query(Folder_.)
  // }

  @override
  Future<int> createFolder(CreateFolderDto createFolderDto) async {
    final folderModel = Folder(
      name: createFolderDto.name,
      needsConfirmation: createFolderDto.needsConfirmation,
    );

    if (createFolderDto.parentFolderId != null) {
      final parentFolder = _folderBox.get(createFolderDto.parentFolderId!);

      folderModel.parent.target = parentFolder;
    }

    _folderBox.put(folderModel);

    return folderModel.id;
  }

  @override
  Future<void> deleteFolder(int folderId) async {
    // TODO: implement deleteFolder
    throw UnimplementedError();
  }
}
