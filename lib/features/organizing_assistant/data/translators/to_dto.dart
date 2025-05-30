import '../../../folder_management/data/translators/to_dto.dart';
import '../../domain/entities/folder_suggestion_entity.dart';
import '../dto/folder_suggestion_dto.dart';
import '../models/folder_suggestion_model.dart';

extension FolderSuggestionToDto on FolderSuggestion {
  FolderSuggestionDto toDto() {
    return FolderSuggestionDto(
      id: id,
      colorHex: colorHex,
      explanation: explanation,
      suggestedFolderId: folder.target!.id,
      assignedFileIds: files.map((file) => file.id).toList(),
    );
  }
}

extension FolderSuggestionEntityToDto on FolderSuggestionEntity {
  FolderSuggestionDto toDto() {
    return FolderSuggestionDto(
      id: id,
      colorHex: colorHex,
      explanation: explanation,
      suggestedFolderId: suggestedFolderId,
      assignedFileIds: assignedFileIds,
    );
  }
}