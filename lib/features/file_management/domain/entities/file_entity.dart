import 'file_metadata_entity.dart';

class FileEntity {
  final String id;
  final bool isPrioritized;
  final int currentVersion;
  final FileMetadataEntity fileMetadata;

  const FileEntity({
    required this.id,
    required this.isPrioritized,
    required this.currentVersion,
    required this.fileMetadata,
  });
}
