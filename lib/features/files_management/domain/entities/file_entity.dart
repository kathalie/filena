import 'file_metadata_entity.dart';

class FileEntity {
  final int id;
  final bool isFavourite;
  final int currentVersion;
  final FileMetadataEntity fileMetadata;

  const FileEntity({
    required this.id,
    required this.isFavourite,
    required this.currentVersion,
    required this.fileMetadata,
  });
}
