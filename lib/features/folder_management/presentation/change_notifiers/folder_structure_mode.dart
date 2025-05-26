import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/types/folder_structure_mode.dart';

class FolderStructureModeNotifier extends StateNotifier<FolderStructureMode> {
  FolderStructureModeNotifier() : super(FolderStructureMode.classified);

  void update(FolderStructureMode newMode) {
    state = newMode;
  }
}

final folderStructureModeProvider =
StateNotifierProvider<FolderStructureModeNotifier, FolderStructureMode>((ref) {
  return FolderStructureModeNotifier();
});