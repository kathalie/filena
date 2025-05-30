import '../../common/helpers/file_category.dart';
import 'file_metadata_entity.dart';

class FileEntity {
  final int id;
  final String storageKey;
  final bool isPrioritized;
  final int currentVersion;
  final String mimeType;
  final String name;
  final FileMetadataEntity fileMetadata;

  const FileEntity({
    required this.id,
    required this.storageKey,
    required this.isPrioritized,
    required this.currentVersion,
    required this.mimeType,
    required this.name,
    required this.fileMetadata,
  });
}

extension FileDetailsEntityCategory on FileEntity {
  FileCategory get fileCategory => FileCategory.fromMimeType(mimeType);
}
