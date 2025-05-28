import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/domain/entities/folder_entity.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../domain/entities/folder_suggestion_entity.dart';

class SelectedSuggestionNotifier
    extends StateNotifier<FolderSuggestionEntity?> {
  final Ref ref;

  SelectedSuggestionNotifier(this.ref) : super(null);

  void update(FolderSuggestionEntity? suggestion) {
    state = suggestion;

    if (suggestion == null) return;

    _selectFolder(suggestion.suggestedFolder);
  }

  void _selectFolder(FolderEntity folder) {
    ref.read(selectedFolderProvider.notifier).select(folder);
  }

  void accept() {
    //TODO accept suggestion
  }

  void decline() {
    //TODO decline suggestion
  }
}

final selectedSuggestionProvider =
    StateNotifierProvider<SelectedSuggestionNotifier, FolderSuggestionEntity?>(
        (ref) {
  return SelectedSuggestionNotifier(ref);
});
