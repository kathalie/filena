import '../../../folder_management/domain/entities/folder_entity.dart';

class FolderSuggestionEntity {
  final int id;
  final String explanation;
  //TODO think of getting rid of this dependency
  final int colorHex;
  final FolderEntity suggestedFolder;
  final List<String> assignedFileIds;

  FolderSuggestionEntity({
    required this.id,
    required this.explanation,
    required this.colorHex,
    required this.suggestedFolder,
    required this.assignedFileIds,
  });
}

