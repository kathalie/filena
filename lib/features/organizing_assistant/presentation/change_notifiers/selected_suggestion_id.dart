import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/api/providers.dart';
import '../../../folder_management/domain/entities/folder_entity.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../api/providers.dart';
import '../../domain/entities/folder_suggestion_entity.dart';

class SelectedSuggestionNotifier
    extends StateNotifier<FolderSuggestionEntity?> {
  final Ref ref;
  late final _folderRepository = ref.read(folderRepositoryProvider);

  SelectedSuggestionNotifier(this.ref) : super(null) {
    ref.listen<AsyncValue<FolderEntity>>(
      selectedFolderProvider,
      (previous, next) {
        if (next.value?.id != state?.suggestedFolderId) {
          state = null;
        }
      },
    );
  }

  void update(FolderSuggestionEntity? suggestion) {
    state = suggestion;

    if (suggestion == null) {
      _folderRepository.rootFolder.then((folder) => _selectFolder(folder));

      return;
    }

    _folderRepository
        .getFolder(suggestion.suggestedFolderId)
        .then((folder) => _selectFolder(folder));
  }

  void _selectFolder(FolderEntity folder) {
    ref.read(selectedFolderProvider.notifier).select(folder);
  }
}

final selectedSuggestionProvider =
    StateNotifierProvider<SelectedSuggestionNotifier, FolderSuggestionEntity?>(
        (ref) {
  return SelectedSuggestionNotifier(ref);
});
