import '../../domain/enums/folder_structure_mode.dart';

abstract interface class UserChoiceRepository {
  Stream<FolderStructureMode> get currentFolderStructureMode;

  void updateCurrentFolderStructureMode(FolderStructureMode newMode);
}