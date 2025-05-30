import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../api/providers.dart';
import '../../domain/entities/file_entity.dart';
import 'file_filters.dart';
import 'file_repository_changes.dart';

final filteredFilesProvider = FutureProvider<List<FileEntity>>((ref) async {
  final fileRepo = ref.watch(fileRepositoryProvider);
  final selectedFolder = await ref.watch(selectedFolderProvider.future);
  final filterState = ref.watch(filterStateProvider);

  ref.watch(fileChangesProvider);

  return fileRepo.getFilteredFiles(
    selectedFolder.id,
    filterState.showOnlyFavorites,
    filterState.showSubfolderFiles,
  );
});
