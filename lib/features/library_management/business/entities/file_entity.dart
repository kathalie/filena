import 'dart:typed_data';

import 'supplementary_structures/file_location.dart';

class FileEntity {
  final String id;
  final String name;
  final DateTime timeCreated;
  final FileLocation location;
  final Uint8List content;
  final String? description;
  final List<String> tagIds;
  final bool isFavourite;
  final String currentFileVersionId;
  final List<String> allVersionIds;

  const FileEntity({
    required this.id,
    required this.name,
    required this.timeCreated,
    required this.currentFileVersionId,
    required this.allVersionIds,
    required this.location,
    required this.content,
    this.description,
    this.tagIds = const [],
    this.isFavourite = false,
  });
}
