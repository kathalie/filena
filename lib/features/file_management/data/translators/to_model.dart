import '../dto/file_create_dto.dart';
import '../models/file_model.dart';

extension FileCreateDtoToModel on FileCreateDto {
  File toModel() {
    return File(
      id: id,
      hash: hash,
      isPrioritized: false,
      embeddings: embeddings,
      currentVersion: 0,
      mimeType: mimeType,
    );
  }
}
