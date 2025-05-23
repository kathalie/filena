import '../../domain/enums/folder_structure_mode.dart';

abstract interface class UserChoiceRepository {
  //MARK: Folder structure mode
  Stream<FolderStructureMode> get currentFolderStructureMode;

  void updateCurrentFolderStructureMode(FolderStructureMode newMode);
}
