import '../../domain/entities/folder_suggestion_entity.dart';
import '../../domain/repository_interfaces/repository.dart';
import '../datasource_interfaces/datasource.dart';
import '../datasource_interfaces/text_embeddings_client.dart';
import '../translators/to_entity.dart';

class FolderSuggestionsRepositoryImpl implements FolderSuggestionsRepository {
  final FolderSuggestionDatasource _folderSuggestionDatasource;
  final TextEmbeddingsClient _embeddingsClient;

  FolderSuggestionsRepositoryImpl({
    required FolderSuggestionDatasource folderSuggestionDatasource,
    required TextEmbeddingsClient embeddingsClient,
  })  : _folderSuggestionDatasource = folderSuggestionDatasource,
        _embeddingsClient = embeddingsClient;

  @override
  Stream get suggestionsChanges =>
      _folderSuggestionDatasource.suggestionsChanges;

  @override
  Future<List<FolderSuggestionEntity>> get allSuggestions async {
    final suggestionDtos = await _folderSuggestionDatasource.allSuggestions;

    return suggestionDtos
        .map((suggestionDto) => suggestionDto.toEntity())
        .toList();
  }

  @override
  Future<void> createSuggestion(
      List<
              ({
                String suggestedFolder,
                String filesKeyword,
                String explanation,
              })>
          analysedPrompts) async {
    for (final analysedPrompt in analysedPrompts) {
      final suggestedFolder = analysedPrompt.suggestedFolder;
      final filesDescription = analysedPrompt.filesKeyword;
      final explanation = analysedPrompt.explanation;
      print('Suggested folder: $suggestedFolder');
      print('For files description: $filesDescription');
      print('With explanation: $explanation');

      final folderEmbeddings =
          await _embeddingsClient.getEmbeddings(suggestedFolder);
      final fileDescriptionEmbeddings =
          await _embeddingsClient.getEmbeddings(filesDescription);

      await _folderSuggestionDatasource.generateSuggestion(
        suggestedFolder: suggestedFolder,
        filesDescription: filesDescription,
        folderEmbeddings: folderEmbeddings,
        filesDescriptionEmbeddings: fileDescriptionEmbeddings,
        explanation: explanation,
      );
    }
  }

  @override
  Future<void> acceptSuggestion(int suggestionId) async {
    await _folderSuggestionDatasource.acceptSuggestion(suggestionId);
  }

  @override
  Future<void> declineSuggestion(int suggestionId) async {
    await _folderSuggestionDatasource.declineSuggestion(suggestionId);
  }

  @override
  Future<void> removeFilesFromSuggestion(
    int suggestionId,
    List<String> fileIds,
  ) async {
    await _folderSuggestionDatasource.removeFilesFromSuggestion(
      suggestionId,
      fileIds,
    );
  }

  @override
  Future<void> acceptAll() async {
    await _folderSuggestionDatasource.acceptAll();
  }
}
