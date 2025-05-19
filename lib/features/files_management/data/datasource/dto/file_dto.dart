
class FileDto {
  final String id, name, hash, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;

  const FileDto({
    required this.id,
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}