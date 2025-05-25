import '../../../folders_management/data/translators/to_entity.dart';
import '../../domain/entities/folder_suggestion_entity.dart';
import '../dto/folder_suggestion_dto.dart';

extension FolderSuggestionDtoToEntity on FolderSuggestionDto {
  FolderSuggestionEntity toEntity() {
    return FolderSuggestionEntity(
      id: id,
      colorHex: colorHex,
      explanation: explanation,
      suggestedFolder: suggestedFolder.toEntity(),
      assignedFileIds: assignedFileIds,
    );
  }
}
