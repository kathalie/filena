import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';

class FolderSuggestionOperationsNotifier extends StateNotifier<AsyncValue<void>> {
  final Ref ref;

  FolderSuggestionOperationsNotifier(this.ref) : super(const AsyncValue.data(null));

  Future<void> accept(int id) async {
    state = const AsyncValue.loading();

    try {
      final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);

      await suggestionsRepo.acceptSuggestion(id);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> decline(int id) async {
    state = const AsyncValue.loading();

    try {
      final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);

      await suggestionsRepo.declineSuggestion(id);

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> acceptAll() async {
    state = const AsyncValue.loading();

    try {
      final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);

      await suggestionsRepo.acceptAll();

      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final folderSuggestionOperationsProvider = StateNotifierProvider<FolderSuggestionOperationsNotifier, AsyncValue<void>>((ref) {
  return FolderSuggestionOperationsNotifier(ref);
});