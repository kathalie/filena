import '../../domain/entities/folder_suggestion_entity.dart';

abstract interface class FolderSuggestionsRepository {
  Stream get suggestionsChanges;

  Future<List<FolderSuggestionEntity>> get allSuggestions;

  Future<void> createSuggestion(
    List<
            ({
              String suggestedFolder,
              String filesKeyword,
              String explanation,
            })>
        analysedPrompts,
  );

  Future<void> removeFilesFromSuggestion(
    int suggestionId,
    List<int> fileIds,
  );

  Future<void> acceptAll();

  Future<void> acceptSuggestion(int suggestionId);

  Future<void> declineSuggestion(int suggestionId);
}
