import '../../../embeddings/domain/repository_interfaces/embeddings_repository.dart';
import '../datasource_interfaces/text_embeddings_client.dart';

class TextEmbeddingsClientImpl implements TextEmbeddingsClient {
  final EmbeddingsRepository _embeddingsRepository;

  TextEmbeddingsClientImpl(EmbeddingsRepository embeddingsRepository)
      : _embeddingsRepository = embeddingsRepository;

  @override
  Future<List<double>> getEmbeddings(String text) async {
    final result = await _embeddingsRepository.generateEmbeddings(text);

    return result.embeddings;
  }
}
