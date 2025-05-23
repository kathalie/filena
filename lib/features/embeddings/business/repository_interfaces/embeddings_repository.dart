import '../../domain/entities/embeddings_entity.dart';

abstract interface class EmbeddingsRepository {
  Future<EmbeddingsEntity> getEmbeddingsForText(String text);

  Future<EmbeddingsEntity> getEmbeddingsForImage(String imageBase64);
}