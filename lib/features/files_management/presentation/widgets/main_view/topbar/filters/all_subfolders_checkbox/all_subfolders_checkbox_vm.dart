import 'package:get_it/get_it.dart';

import '../../../../../../business/repository_interfaces/user_choice_repository.dart';

class AllSubfoldersCheckboxViewModel {
  final _userChoiceRepository = GetIt.I.get<UserChoiceRepository>();

  Stream<bool> get showSubfolderFiles =>
      _userChoiceRepository.showSubfolderFiles;

  void toggleShowSubfolderFiles() {
    _userChoiceRepository.toggleShowSubfolderFiles();
  }
}
