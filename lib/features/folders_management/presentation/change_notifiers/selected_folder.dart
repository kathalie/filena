import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/folder_entity.dart';

class SelectedFolderNotifier extends StateNotifier<FolderEntity?> {
  SelectedFolderNotifier() : super(null);

  void select(FolderEntity? folder) {
    state = folder;
  }
}

final selectedFolderProvider =
StateNotifierProvider<SelectedFolderNotifier, FolderEntity?>((ref) {
  return SelectedFolderNotifier();
});