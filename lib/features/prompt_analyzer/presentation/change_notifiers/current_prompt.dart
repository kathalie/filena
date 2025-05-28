import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../organizing_assistant/api/providers.dart';
import '../../api/providers.dart';
import 'analysed_prompt.dart';

class CurrentPromptNotifier extends StateNotifier<String> {
  final Ref ref;
  late final _promptRepository = ref.read(promptAnalysisRepositoryProvider);

  CurrentPromptNotifier(this.ref) : super('');

  void update(String newText) {
    state = newText;
  }

  Future<void> submitPrompt() async {
    if (state.isEmpty) return;

    final prompt = state;
    clear();

    final analysisResults = await _promptRepository.analyseUserPrompt(prompt);
    ref.read(analysedPromptProvider.notifier).update(analysisResults);

    final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);
    await suggestionsRepo.createSuggestion(
      analysisResults
          .map(
            (result) => (
        filesKeyword: result.filesKeyword,
        suggestedFolder: result.suggestedFolder,
        explanation: result.explanation,
        ),
      )
          .toList(),
    );
  }

  void clear() {
    state = '';
  }
}

final currentPromptProvider =
    StateNotifierProvider<CurrentPromptNotifier, String>((ref) {
  return CurrentPromptNotifier(ref);
});

