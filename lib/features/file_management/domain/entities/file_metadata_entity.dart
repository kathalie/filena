class FileMetadataEntity {
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;

  FileMetadataEntity({
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
  });
}
