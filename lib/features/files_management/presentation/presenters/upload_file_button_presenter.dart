import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folders_management/domain/entities/folder_entity.dart';
import '../../api/providers.dart';
import '../../domain/repository_interfaces/file_repository.dart';

final uploadStateProvider = StateNotifierProvider<UploadStateNotifier, UploadState>((ref) {
  return UploadStateNotifier(ref.watch(fileRepositoryProvider));
});

class UploadState {
  final bool isLoading;
  final String? error;

  UploadState({
    required this.isLoading,
    this.error,
  });

  UploadState copyWith({
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return UploadState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class UploadStateNotifier extends StateNotifier<UploadState> {
  final FileRepository _fileRepository;

  UploadStateNotifier(this._fileRepository) : super(UploadState(isLoading: false));

  Future<void> createFile(String path, FolderEntity? parentFolder) async {
    try {
      state = state.copyWith(isLoading: true, clearError: true);
      await _fileRepository.createFile(path, parentFolder?.id);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: 'Upload failed: $e');
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}