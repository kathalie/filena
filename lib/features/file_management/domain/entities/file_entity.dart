import 'file_metadata_entity.dart';

class FileEntity {
  final int id;
  final String storageKey;
  final bool isPrioritized;
  final int currentVersion;
  final FileMetadataEntity fileMetadata;

  const FileEntity({
    required this.id,
    required this.storageKey,
    required this.isPrioritized,
    required this.currentVersion,
    required this.fileMetadata,
  });
}
