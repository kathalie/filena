import '../../common/helpers/file_category.dart';

class FileMetadataEntity {
  final String name;
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;
  final String mimeType;

  FileMetadataEntity({
    required this.name,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    required this.mimeType,
  });
}

extension FileDetailsEntityCategory on FileMetadataEntity {
  FileCategory get fileCategory => FileCategory.fromMimeType(mimeType);
}
