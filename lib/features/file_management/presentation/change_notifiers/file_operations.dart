import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../api/providers.dart';
import '../../domain/entities/file_entity.dart';

class FileOperationsNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;
  late final _fileRepo = ref.read(fileRepositoryProvider);

  FileOperationsNotifier(this.ref) : super(const AsyncValue.data(null));

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

  Future<void> addFileToSelectedFolder(FileEntity fileEntity) async {
    state = const AsyncValue.loading();

    try {
      final selectedFolder = ref.watch(selectedFolderProvider).value;

      if (selectedFolder == null) {
        print('Folder is not selected');
        state = const AsyncValue.data(null);
        return;
      }

      final parentFolderIds = await _fileRepo.getParentFolderIds(fileEntity.id);

      if (parentFolderIds.contains(selectedFolder.id)) {
        state = const AsyncValue.data(null);
        throw 'File is already assigned to this folder';
      }

      await _fileRepo.assignFileToFolder(fileEntity.id, selectedFolder.id);

      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }

  Future<void> removeFileFromFolder(int fileId, int folderId) async {
    state = const AsyncValue.loading();

    try {
      await _fileRepo.removeFilesFromFolder([fileId], folderId);

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

  Future<void> openFile(int fileId) async {
    state = const AsyncValue.loading();

    try {
      await _fileRepo.openFile(fileId);

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