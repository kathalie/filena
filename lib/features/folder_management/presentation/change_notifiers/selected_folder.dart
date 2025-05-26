import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/entities/folder_entity.dart';

class SelectedFolderNotifier extends AsyncNotifier<FolderEntity> {
  @override
  FutureOr<FolderEntity> build() async {
    return ref.read(folderRepositoryProvider).rootFolder;
  }

  void select(FolderEntity folder) {
    state = AsyncData(folder);
  }
}

final selectedFolderProvider =
    AsyncNotifierProvider<SelectedFolderNotifier, FolderEntity>(() {
  return SelectedFolderNotifier();
});
