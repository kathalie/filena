
import '../dto/embeddings_dto.dart';

abstract interface class EmbeddingsDatasource {
  Future<EmbeddingsDto> generateEmbeddings(String text);
}
