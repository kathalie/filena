class FolderSuggestionEntity {
  final int id;
  final String explanation;
  final int colorHex;
  final int suggestedFolderId;
  final List<int> assignedFileIds;

  FolderSuggestionEntity({
    required this.id,
    required this.explanation,
    required this.colorHex,
    required this.suggestedFolderId,
    required this.assignedFileIds,
  });
}

