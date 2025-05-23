import '../../domain/entities/embeddings_entity.dart';

abstract interface class EmbeddingsRepository {
  Future<EmbeddingsEntity> getEmbeddingForText(String text);

  Future<EmbeddingsEntity> getEmbeddingForImage(String imageBase64);
}