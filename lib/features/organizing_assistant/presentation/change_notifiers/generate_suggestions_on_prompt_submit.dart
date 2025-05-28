import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../prompt_analyzer/presentation/change_notifiers/analysed_prompt.dart';
import '../../api/providers.dart';

final generateSuggestionsOnPromptSubmit = FutureProvider<void>((ref) async {
  final suggestionsRepo = ref.read(folderSuggestionRepositoryProvider);
  final analysisResults = ref.watch(analysedPromptProvider);

  print('Triggered!');

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
});
