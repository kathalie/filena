import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/domain/types/folder_structure_mode.dart';
import '../../../folder_management/presentation/change_notifiers/folder_structure_mode.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../api/providers.dart';
import '../../domain/entities/file_entity.dart';
import 'current_file_type.dart';
import 'file_filters.dart';
import 'file_repository_changes.dart';

final filteredFilesProvider = FutureProvider<List<FileEntity>>((ref) async {
  final fileRepo = ref.watch(fileRepositoryProvider);
  final selectedFolder = await ref.watch(selectedFolderProvider.future);
  final filterState = ref.watch(filterStateProvider);
  final folderStructureMode = ref.watch(folderStructureModeProvider);

  ref.watch(fileChangesProvider);
  ref.watch(fileInFolderChangesProvider);

  if (folderStructureMode == FolderStructureMode.unclassified) {
    final selectedCategory = ref.watch(selectedFileCategoryProvider);

    return fileRepo.getUnclassifiedFiles(
      selectedCategory,
      filterState.showOnlyFavorites,
    );
  }

  final files = await fileRepo.getFilteredFiles(
    selectedFolder.id,
    filterState.showOnlyFavorites,
    filterState.showSubfolderFiles,
  );

  return files.sortedBy<String>((file) => file.name);
});
