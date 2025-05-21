import '../../../domain/entities/file_entity.dart';

class FileCreateDto {
  final String name, hash, mimeType;

  const FileCreateDto({
    required this.name,
    required this.hash,
    required this.mimeType,
  });
}
