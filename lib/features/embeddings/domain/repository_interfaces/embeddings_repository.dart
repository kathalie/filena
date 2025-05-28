import '../../domain/entities/embeddings_entity.dart';

abstract interface class EmbeddingsRepository {
  Future<EmbeddingsEntity> generateEmbeddings(String text);
}
