import '../../domain/supplementary_structures/file_location.dart';

class FileEntity {
  final String id;
  final String name;
  final int sizeInBytes;
  final DateTime dateCreated;
  final FileLocation location;
  final String? description;
  final List<String> tagIds;
  final bool isFavourite;

  const FileEntity({
    required this.id,
    required this.name,
    required this.sizeInBytes,
    required this.dateCreated,
    required this.location,
    this.description,
    this.tagIds = const [],
    this.isFavourite = false,
  });
}
