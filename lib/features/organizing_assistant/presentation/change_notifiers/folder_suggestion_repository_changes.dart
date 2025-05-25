import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';

final suggestionsChangesProvider = StreamProvider<void>((ref) {
  final suggestionsRepo = ref.watch(folderSuggestionRepositoryProvider);

  return suggestionsRepo.suggestionsChanges;
});
