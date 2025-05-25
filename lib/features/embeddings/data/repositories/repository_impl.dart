import '../../domain/entities/embeddings_entity.dart';
import '../../domain/repository_interfaces/embeddings_repository.dart';
import '../datasource_interfaces/client.dart';
import '../translators/to_domain.dart';

class EmbeddingsRepositoryImpl implements EmbeddingsRepository {
  final EmbeddingsDatasource _embeddingsDatasource;

  EmbeddingsRepositoryImpl(this._embeddingsDatasource);

  @override
  Future<EmbeddingsEntity> getEmbeddingsForImage(String imageBase64) async {
    final embeddingsDto =
        await _embeddingsDatasource.getEmbeddingsForImage(imageBase64);

    return embeddingsDto.toEntity();
  }

  @override
  Future<EmbeddingsEntity> getEmbeddingsForText(String text) async {
    final embeddingsDto =
        await _embeddingsDatasource.getEmbeddingsForText(text);

    return embeddingsDto.toEntity();
  }
}