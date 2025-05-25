import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folders_management/presentation/change_notifiers/selected_folder.dart';
import '../../api/providers.dart';
import '../../domain/entities/file_entity.dart';
import 'file_filters.dart';
import 'file_repository_changes.dart';

final filteredFilesProvider = FutureProvider<List<FileEntity>>((ref) {
  final fileRepo = ref.watch(fileRepositoryProvider);
  final selectedFolder = ref.watch(selectedFolderProvider);
  final filterState = ref.watch(filterStateProvider);

  ref.watch(fileChangesProvider);

  return fileRepo.getFilteredFiles(
    selectedFolder?.id,
    filterState.showOnlyFavorites,
    filterState.showSubfolderFiles,
  );
});