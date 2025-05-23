import 'package:get_it/get_it.dart';

import '../../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../../domain/entities/folder_entity.dart';

class FolderControlPresenter {
  final _folderRepository = GetIt.I.get<FolderRepository>();

  Stream<FolderEntity?> get selectedFolder => _folderRepository.selectedFolder;

  Future<void> createNewFolder(String name) async {
    final currentFolder = await _folderRepository.selectedFolder.first;

    await _folderRepository.createFolder(currentFolder?.id, name);
  }
}
