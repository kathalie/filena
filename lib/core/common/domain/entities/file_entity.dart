import 'package:multiversa/core/common/domain/entities/user_entity.dart';

class FileEntity {
  final String id;
  final String name;
  final int sizeInBytes;
  final DateTime dateCreated;
  final UserEntity author;
  final String? description;
  final List<String> tags; //TODO TagEntity
  final bool isFavourite;

  // TODO versions???

  const FileEntity({
    required this.id,
    required this.name,
    required this.sizeInBytes,
    required this.dateCreated,
    required this.author,
    this.description,
    this.tags = const [],
    this.isFavourite = false,
  });
}
