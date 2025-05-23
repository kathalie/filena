import 'package:get_it/get_it.dart';

import '../../../../business/providers/state_provider.dart';
import '../../../../domain/enums/folder_structure_mode.dart';

class FolderStructureControlPresenter {
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<FolderStructureMode> get currentFolderStructure =>
      _stateProvider.currentFolderStructureMode;

  void onValueChanged(FolderStructureMode newFolderStructureMode) {
    _stateProvider
        .updateCurrentFolderStructureMode(newFolderStructureMode);
  }
}
