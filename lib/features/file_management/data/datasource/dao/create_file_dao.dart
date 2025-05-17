class CreateFileDao {
  final String name, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;

  const CreateFileDao({
    required this.name,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}