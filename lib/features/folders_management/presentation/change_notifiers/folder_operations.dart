import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import 'selected_folder.dart';

class FolderOperationsNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  FolderOperationsNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> createFolder(String name) async {
    state = const AsyncValue.loading();

    try {
      final folderRepo = ref.read(folderRepositoryProvider);
      final selectedFolder = ref.read(selectedFolderProvider);

      await folderRepo.createFolder(selectedFolder?.id, name);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> renameSelectedFolder(String newName) async {
    state = const AsyncValue.loading();

    final selectedFolder = ref.read(selectedFolderProvider);

    if (selectedFolder == null) return;

    try {
      final folderRepo = ref.read(folderRepositoryProvider);

      await folderRepo.updateFolder(selectedFolder.id, newName);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteSelectedFolder() async {
    state = const AsyncValue.loading();

    final selectedFolder = ref.read(selectedFolderProvider);

    if (selectedFolder == null) return;

    try {
      final folderRepo = ref.read(folderRepositoryProvider);

      await folderRepo.deleteFolder(selectedFolder.id);

      final parentId = selectedFolder.parentId;

      ref.read(selectedFolderProvider.notifier).select(
        parentId != null ? await folderRepo.getFolder(parentId) : null,
      );

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final folderOperationsProvider = StateNotifierProvider<FolderOperationsNotifier, AsyncValue<void>>((ref) {
  return FolderOperationsNotifier(ref);
});