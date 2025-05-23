import '../../business/repository_interfaces/embeddings_repository.dart';
import '../../domain/entities/embeddings_entity.dart';
import '../datasource/dto/embeddings_dto.dart';
import '../datasource/embeddings_datasource.dart';

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

    print(embeddingsDto);

    return embeddingsDto.toEntity();
  }
}

extension on EmbeddingsDto {
  EmbeddingsEntity toEntity() => EmbeddingsEntity(this);
}
