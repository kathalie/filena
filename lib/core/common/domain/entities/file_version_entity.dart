import '../supplementary_structures/file_location.dart';

class FileVersionEntity {
  final String id;
  final String fileId;
  final int sizeInBytes;
  final DateTime dateEdited;
  final String editorId;
  final FileLocation location;

  const FileVersionEntity({
    required this.id,
    required this.fileId,
    required this.sizeInBytes,
    required this.dateEdited,
    required this.editorId,
    required this.location,
  });
}
