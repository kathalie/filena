import '../../domain/entities/embeddings_entity.dart';
import '../dto/embeddings_dto.dart';

extension EmbeddingsDtoToEntity on EmbeddingsDto {
  EmbeddingsEntity toEntity() => EmbeddingsEntity(this);
}
