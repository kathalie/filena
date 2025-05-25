import '../../domain/entities/prompt_entity.dart';
import '../../domain/repository_interfaces/repository.dart';
import '../datasource_interfaces/llm_client.dart';
import '../translators/to_entity.dart';

class PromptAnalysisRepositoryImpl implements PromptAnalysisRepository {
  final LlmClient _llmClient;

  PromptAnalysisRepositoryImpl(LlmClient llmClient): _llmClient = llmClient;

  @override
  Future<List<AnalysedPromptEntity>> analyseUserPrompt(String prompt) async {
    final resultDtos = await _llmClient.analyseUserPrompt(prompt);

    return resultDtos.map((resultDto) => resultDto.toEntity()).toList();
  }


}