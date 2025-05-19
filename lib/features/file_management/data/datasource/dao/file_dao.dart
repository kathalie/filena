import '../../../domain/entities/file_entity.dart';

class FileDao {
  final String id, name, hash, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;

  const FileDao({
    required this.id,
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}