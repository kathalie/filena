import 'package:multiversa/core/common/domain/entities/user_entity.dart';

import 'file_entity.dart';

class CollectionEntity {
  final String id;
  final String name;
  final UserEntity author;
  final List<UserEntity> collaborators;
  final List<FileEntity> files;

  const CollectionEntity({
    required this.id,
    required this.name,
    required this.author,
    this.collaborators = const [],
    this.files = const [],
  });
}
