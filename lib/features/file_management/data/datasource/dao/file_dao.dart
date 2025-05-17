class FileDao {
  final String id, name, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;

  const FileDao({
    required this.id,
    required this.name,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}