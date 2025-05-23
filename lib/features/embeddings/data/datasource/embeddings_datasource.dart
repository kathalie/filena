import 'dto/embeddings_dto.dart';

abstract interface class EmbeddingsDatasource {
  Future<EmbeddingsDto> getEmbeddingsForText(String text);

  Future<EmbeddingsDto> getEmbeddingsForImage(String imageBase64);
}