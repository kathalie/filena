import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../file_management/api/providers.dart';
import '../../../file_management/domain/entities/file_entity.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import 'all_folder_suggestions.dart';

final fileSuggestionsInFolderProvider = FutureProvider<
    List<
        ({
          int suggestionId,
          int colorHex,
          List<FileEntity> files,
        })>>((ref) async {
  final fileRepo = ref.watch(fileRepositoryProvider);
  final allSuggestions = await ref.watch(allSuggestionsProvider.future);
  final selectedFolder = await ref.watch(selectedFolderProvider.future);

  final matchingSuggestions = allSuggestions
      .where(
        (s) => (s.suggestion.suggestedFolderId == selectedFolder.id),
      )
      .toList();

  return Future.wait(
    matchingSuggestions.map(
      (s) async => (
        suggestionId: s.suggestion.id,
        colorHex: s.suggestion.colorHex,
        files: await fileRepo.getFiles(s.suggestion.assignedFileIds),
      ),
    ),
  );
});
