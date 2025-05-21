import 'package:get_it/get_it.dart';

import '../../../business/repository_interfaces/user_choice_repository.dart';
import '../../../domain/enums/folder_structure_mode.dart';

class FolderStructureSideBarViewModel {
  final _userChoiceRepository = GetIt.I.get<UserChoiceRepository>();

  Stream<FolderStructureMode> get currentFolderStructure =>
      _userChoiceRepository.currentFolderStructureMode;
}
