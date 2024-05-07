import '../supplementary_structures/file_location.dart';
import 'user_entity.dart';

class FileEntity {
  final String id;
  final String name;
  final int sizeInBytes;
  final DateTime dateCreated;
  final UserEntity author;
  final FileLocation location;
  final String? description;
  final List<String> tagIds;
  final bool isFavourite;

  const FileEntity({
    required this.id,
    required this.name,
    required this.sizeInBytes,
    required this.dateCreated,
    required this.author,
    required this.location,
    this.description,
    this.tagIds = const [],
    this.isFavourite = false,
  });
}
