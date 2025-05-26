import '../../../file_management/domain/entities/file_metadata_entity.dart';

class FileVersion {
  final int id;
  final FileMetadataEntity fileMetadata;

  FileVersion({
    required this.id,
    required this.fileMetadata,
  });
}
