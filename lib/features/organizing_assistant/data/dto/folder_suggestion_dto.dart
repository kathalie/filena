import '../../../folder_management/data/dto/folder_dto.dart';

class FolderSuggestionDto {
  final int id;
  final int colorHex;
  final String explanation;
  final int suggestedFolderId;
  final List<int> assignedFileIds;

  FolderSuggestionDto({
    required this.id,
    required this.colorHex,
    required this.explanation,
    required this.suggestedFolderId,
    required this.assignedFileIds,
  });
}
