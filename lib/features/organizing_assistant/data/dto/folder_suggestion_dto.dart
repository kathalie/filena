import '../../../folder_management/data/dto/folder_dto.dart';

class FolderSuggestionDto {
  final int id;
  final int colorHex;
  final String explanation;
  // TODO Think of getting rid of this dependency
  final FolderDto suggestedFolder;
  final List<String> assignedFileIds;

  FolderSuggestionDto({
    required this.id,
    required this.colorHex,
    required this.explanation,
    required this.suggestedFolder,
    required this.assignedFileIds,
  });
}
