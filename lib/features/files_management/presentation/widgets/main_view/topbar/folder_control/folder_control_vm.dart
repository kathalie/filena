import 'package:get_it/get_it.dart';

import '../../../../../business/providers/state_provider.dart';
import '../../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../../domain/entities/folder_entity.dart';

class FolderControlPresenter {
  final _folderRepository = GetIt.I.get<FolderRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<FolderEntity?> get selectedFolder => _stateProvider.selectedFolder;

  Future<void> createNewFolder(String name) async {
    final currentFolder = await _stateProvider.selectedFolder.first;

    await _folderRepository.createFolder(currentFolder?.id, name);
  }
}
