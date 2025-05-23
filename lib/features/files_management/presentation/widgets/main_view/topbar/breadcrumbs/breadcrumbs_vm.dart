import 'package:get_it/get_it.dart';

import '../../../../../business/providers/state_provider.dart';
import '../../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../../domain/entities/folder_entity.dart';

class BreadcrumbsPresenter {
  final _folderRepository = GetIt.I.get<FolderRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<List<FolderEntity>> get folderPath =>
      _stateProvider.folderPath;

  void navigateToFolder(FolderEntity? folder) {
    _stateProvider.selectFolder(folder);
  }
}
