class FileMetadataDto {
  final String name;
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;

  FileMetadataDto({
    required this.name,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}
