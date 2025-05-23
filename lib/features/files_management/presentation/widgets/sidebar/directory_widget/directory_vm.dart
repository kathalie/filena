import 'package:get_it/get_it.dart';

import '../../../../../../core/presentation/const/const.dart';
import '../../../../business/providers/state_provider.dart';
import '../../../../business/repository_interfaces/folder_repository.dart';
import '../../../../domain/entities/folder_entity.dart';

typedef DirectoryCharacteristics = ({
  String name,
  bool hasNestedFolders,
  bool isRoot,
});

class DirectoryPresenter {
  final FolderEntity? folderEntity;
  final bool hasNestedFolders;
  final bool isRoot;
  final String name;

  final _folderRepository = GetIt.I.get<FolderRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<FolderEntity?> get selectedFolder =>
      _stateProvider.selectedFolder;

  DirectoryPresenter({
    required this.folderEntity,
    required this.hasNestedFolders,
  })  : isRoot = folderEntity == null,
        name = folderEntity == null ? Const.rootFolderName : folderEntity.name;

  void selectFolder(FolderEntity? folder) {
    _stateProvider.selectFolder(folder);
  }
}
