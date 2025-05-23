import 'dto/embeddings_dto.dart';

abstract interface class EmbeddingsDatasource {
  Future<EmbeddingsDto> getEmbeddingForText(String text);

  Future<EmbeddingsDto> getEmbeddingForImage(String imageBase64);
}