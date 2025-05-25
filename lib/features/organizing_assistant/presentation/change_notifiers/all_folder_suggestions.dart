import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/entities/folder_suggestion_entity.dart';
import 'folder_suggestion_repository_changes.dart';

final allSuggestionsProvider = FutureProvider<List<FolderSuggestionEntity>>((ref) {
  final suggestionsRepo = ref.watch(folderSuggestionRepositoryProvider);

  ref.watch(suggestionsChangesProvider);

  return suggestionsRepo.allSuggestions;
});
