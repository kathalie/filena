import '../../domain/entities/folder_suggestion_entity.dart';

abstract interface class FolderSuggestionsRepository {
  Stream get suggestionsChanges;

  Future<List<FolderSuggestionEntity>> get allSuggestions;

  Future<void> createSuggestion(
    List<
            ({
              String suggestedFolder,
              String filesKeyword,
            })>
        analysedPrompts,
  );

  Future<void> removeFilesFromSuggestion(
    FolderSuggestionEntity suggestion,
    List<int> fileIds,
  );

  Future<void> acceptAll();

  Future<void> acceptSuggestion(int suggestionId);

  Future<void> declineSuggestion(int suggestionId);
}
