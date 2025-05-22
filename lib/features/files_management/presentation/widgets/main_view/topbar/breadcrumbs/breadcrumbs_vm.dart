import 'package:get_it/get_it.dart';

import '../../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../../domain/entities/folder_entity.dart';

class BreadcrumbsViewModel {
  final _folderRepository = GetIt.I.get<FolderRepository>();

  Stream<List<FolderEntity>> get folderPath =>
      _folderRepository.pathToSelectedFolder;

  void navigateToFolder(FolderEntity? folder) {
    _folderRepository.selectFolder(folder);
  }
}
