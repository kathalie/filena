import '../../domain/entities/analysed_prompt_entity.dart';
import '../dto/analysed_user_request_dto.dart';

extension AnalysedPromptDtoToEntity on AnalysedPromptDto {
  AnalysedPromptEntity toEntity() {
    return AnalysedPromptEntity(
      filesKeyword: filesKeyword,
      suggestedFolder: suggestedFolder,
      explanation: explanation,
    );
  }
}
