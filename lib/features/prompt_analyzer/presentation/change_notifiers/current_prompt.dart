import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../organizing_assistant/api/providers.dart';
import '../../api/providers.dart';

class CurrentPromptNotifier extends StateNotifier<String> {
  final Ref ref;

  CurrentPromptNotifier(this.ref) : super('');

  void update(String newText) {
    state = newText;
  }

  Future<void> submitPrompt() async {
    if (state.isEmpty) return;

    final promptRepo = ref.read(promptAnalysisRepositoryProvider);
    final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);

    final analysisResults = await promptRepo.analyseUserPrompt(state);
    await suggestionsRepo.createSuggestion(
      analysisResults
          .map(
            (result) => (
              filesKeyword: result.filesKeyword,
              suggestedFolder: result.suggestedFolder,
            ),
          )
          .toList(),
    );

    clear();
  }

  void clear() {
    state = '';
  }
}

final currentPromptProvider =
    StateNotifierProvider<CurrentPromptNotifier, String>((ref) {
  return CurrentPromptNotifier(ref);
});
