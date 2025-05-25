import 'logged_exception.dart';

class LLMException extends LoggableException {
  LLMException.failedToRetrieveEmbeddings({
    super.explanation,
    super.cause,
  }) : super(
          title: 'Failed to retrieve embeddings.',
        );

  LLMException.failedToAnalyseUserPrompt({
    required String prompt,
    super.cause,
  }) : super(
          title:
              'Failed to analyze the following prompt for files organisation.',
          explanation: 'Prompt: $prompt',
        );
}
