import '../dto/folder_suggestion_dto.dart';

abstract interface class FolderSuggestionDatasource {
  Stream get suggestionsChanges;

  Future<List<FolderSuggestionDto>> get allSuggestions;

  Future<void> generateSuggestion({
    required String suggestedFolder,
    required List<double> folderEmbeddings,
    required String filesDescription,
    required List<double> filesDescriptionEmbeddings,
    required String explanation,
  });

  Future<void> removeFilesFromSuggestion(
      int suggestionId,
      List<int> fileIds,
      );

  Future<void> acceptAll();

  Future<void> acceptSuggestion(int suggestionId);

  Future<void> declineSuggestion(int suggestionId);
}
