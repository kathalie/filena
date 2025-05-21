class FileDetailsEntity {
  final String name;
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;
  final String mimeType;

  FileDetailsEntity({
    required this.name,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    required this.mimeType,
  });
}
