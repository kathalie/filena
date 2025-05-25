import '../dto/analysed_user_request_dto.dart';

abstract interface class LlmClient {
  Future<List<AnalysedPromptDto>> analyseUserPrompt(String prompt);
}
