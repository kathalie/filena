import 'dart:typed_data';

class FileEntity {
  final String id, name, hash, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;
  // final Uint8List content;
  final String fileLocalPath;

  const FileEntity({
    required this.id,
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    // required this.content,
    required this.fileLocalPath,
  });
}