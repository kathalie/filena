import '../dto/file_dto.dart';
import '../models/file_model.dart';

extension FileToDto on File {
  FileDto toDto() {
    return FileDto(
      id: id,
      storageKey: storageKey,
      isPrioritized: isPrioritized,
      currentVersion: currentVersion,
      name: name,
      mimeType: mimeType,
    );
  }
}