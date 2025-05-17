import 'dart:typed_data';

class UpdateFileEntity {
  final String id, name, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;
  final Uint8List content;

  const UpdateFileEntity({
    required this.id,
    required this.name,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    required this.content,
  });
}
