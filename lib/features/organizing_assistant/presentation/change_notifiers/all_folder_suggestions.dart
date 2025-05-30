import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../folder_management/api/providers.dart';
import '../../../folder_management/domain/entities/folder_entity.dart';
import '../../../folder_management/presentation/change_notifiers/folder_repository_changes.dart';
import '../../api/providers.dart';
import '../../domain/entities/folder_suggestion_entity.dart';
import 'folder_suggestion_repository_changes.dart';

final allSuggestionsProvider = FutureProvider<
    List<
        ({
          FolderSuggestionEntity suggestion,
          FolderEntity folder,
        })>>((ref) async {
  final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);
  final folderRepo = ref.read(folderRepositoryProvider);

  ref.watch(suggestionsChangesProvider);
  ref.watch(folderChangesProvider);

  final allSuggestions = await suggestionsRepo.allSuggestions;

  return Future.wait(
    allSuggestions.map((suggestion) async {
      final folder = await folderRepo.getFolder(suggestion.suggestedFolderId);
      return (suggestion: suggestion, folder: folder);
    }),
  );
});
