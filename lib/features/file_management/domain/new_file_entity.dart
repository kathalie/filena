import 'dart:typed_data';

class NewFileEntity {
  final String name, mimeType;
  final int sizeInBytes;
  final DateTime timeCreated, timeLastModified;
  final Uint8List content;

  const NewFileEntity({
    required this.name,
    required this.mimeType,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    required this.content,
  });
}