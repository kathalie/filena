import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../api/providers.dart';

class FileOperationsNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  late final _fileRepo = ref.read(fileRepositoryProvider);

  FileOperationsNotifier(this.ref) : super(const AsyncValue.data(null));

  // Future<void> renameFile(int fileId, String newName) async {
  //   state = const AsyncValue.loading();
  //
  //   try {
  //     await fileRepo.updateFile(selectedFolder.id, newName);
  //
  //     state = const AsyncValue.data(null);
  //   } catch (error, stack) {
  //     state = AsyncValue.error(error, stack);
  //   }
  // }

  Future<void> removeFileFromSelectedFolder(int fileId) async {
    state = const AsyncValue.loading();

    try {
      final selectedFolder = ref.watch(selectedFolderProvider).value;

      if (selectedFolder == null) {
        print('Folder is not selected');
        state = const AsyncValue.data(null);
        return;
      }

      await _fileRepo.removeFilesFromFolder([fileId], selectedFolder.id);

      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> deleteFileFromSystem(int fileId) async {
    state = const AsyncValue.loading();

    try {
      await _fileRepo.deleteFile(fileId);

      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}

final fileOperationsProvider =
StateNotifierProvider<FileOperationsNotifier, AsyncValue<void>>((ref) {
  return FileOperationsNotifier(ref);
});