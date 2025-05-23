import 'package:get_it/get_it.dart';

import '../../../../../../business/providers/state_provider.dart';

class AllSubfoldersCheckboxPresenter {
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<bool> get showSubfolderFiles =>
      _stateProvider.showSubfolderFiles;

  void toggleShowSubfolderFiles() {
    _stateProvider.toggleShowSubfolderFiles();
  }
}
