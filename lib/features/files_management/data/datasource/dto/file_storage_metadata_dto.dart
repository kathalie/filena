class FileStorageMetadataDto {
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;

  FileStorageMetadataDto({
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}
