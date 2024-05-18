import 'dart:typed_data';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';

class FileVersionEntity {
  final String id;
  final String fileId;
  final int sizeInBytes;
  final DateTime dateEdited;
  final FileLocation location;
  final Uint8List content;
  final String? description;
  final List<String> tagIds;
  final bool isFavourite;

  const FileVersionEntity({
    required this.id,
    required this.fileId,
    required this.sizeInBytes,
    required this.dateEdited,
    required this.location,
    required this.content,
    this.description,
    this.tagIds = const [],
    this.isFavourite = false,
  });
}
