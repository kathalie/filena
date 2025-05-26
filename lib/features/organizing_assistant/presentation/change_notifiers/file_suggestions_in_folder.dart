import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../file_management/api/providers.dart';
import '../../../file_management/domain/entities/file_entity.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import 'all_folder_suggestions.dart';
import 'selected_suggestion_id.dart';

final fileSuggestionsInFolderProvider =
    FutureProvider<List<({int colorHex, List<FileEntity> files})>>((ref) async {
  final fileRepo = ref.watch(fileRepositoryProvider);
  final allSuggestions = await ref.watch(allSuggestionsProvider.future);
  final selectedFolder = await ref.watch(selectedFolderProvider.future);
  final currentSuggestionId = ref.watch(selectedSuggestionIdProvider);

  final matchingSuggestions = allSuggestions
      .where(
        (s) =>
            (s.suggestedFolder.id == selectedFolder.id) &&
            (s.id == (currentSuggestionId ?? s.id)),
      )
      .toList();

  return Future.wait(
    matchingSuggestions.map(
      (s) async => (
        colorHex: s.colorHex,
        files: await fileRepo.getFiles(s.assignedFileIds),
      ),
    ),
  );
});
