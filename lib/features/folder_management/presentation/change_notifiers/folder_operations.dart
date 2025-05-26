import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/entities/folder_entity.dart';
import 'selected_folder.dart';

class FolderOperationsNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  late final folderRepo = ref.read(folderRepositoryProvider);

  FolderOperationsNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> createFolder(String name) async {
    state = const AsyncValue.loading();

    try {
      final selectedFolder = await ref.read(selectedFolderProvider.future);
      await folderRepo.createFolder(selectedFolder.id, name);

      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> renameSelectedFolder(String newName) async {
    state = const AsyncValue.loading();

    try {
      final selectedFolder = await ref.read(selectedFolderProvider.future);
      await folderRepo.updateFolder(selectedFolder.id, newName);

      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> deleteSelectedFolder() async {
    state = const AsyncValue.loading();

    try {
      final selectedFolder = await ref.read(selectedFolderProvider.future);
      await deleteFolder(selectedFolder);

      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> deleteFolder(FolderEntity folder) async {
    await folderRepo.deleteFolder(folder.id);
    await _selectParentOf(folder);
  }

  Future<void> _selectParentOf(FolderEntity folder) async {
    try {
      final parentId = folder.parentId;
      final rootFolder = await folderRepo.rootFolder;
      final parentFolder = parentId != null
          ? await folderRepo.getFolder(parentId)
          : rootFolder;

      ref.read(selectedFolderProvider.notifier).select(parentFolder ?? rootFolder);
    } catch (e) {
      final rootFolder = await folderRepo.rootFolder;
      ref.read(selectedFolderProvider.notifier).select(rootFolder);
    }
  }
}

final folderOperationsProvider =
StateNotifierProvider<FolderOperationsNotifier, AsyncValue<void>>((ref) {
  return FolderOperationsNotifier(ref);
});