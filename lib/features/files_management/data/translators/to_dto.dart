import '../dto/file_dto.dart';
import '../models/file_model.dart';

extension FileToDto on File {
  FileDto toDto() {
    return FileDto(
      id: id,
      isFavourite: isFavourite,
      currentVersion: currentVersion,
      mimeType: mimeType,
    );
  }
}