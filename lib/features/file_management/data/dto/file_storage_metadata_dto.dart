class FileMetadataDto {
  final String name;
  final String extension;
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;

  FileMetadataDto({
    required this.name,
    required this.extension,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}
