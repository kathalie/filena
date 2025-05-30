class FileMetadataDto {
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;

  FileMetadataDto({
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}
