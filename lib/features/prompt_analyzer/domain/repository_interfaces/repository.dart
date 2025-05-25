import '../entities/prompt_entity.dart';

abstract interface class PromptAnalysisRepository {
  Future<List<AnalysedPromptEntity>> analyseUserPrompt(String prompt);
}
