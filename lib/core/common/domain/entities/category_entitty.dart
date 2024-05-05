import 'package:multiversa/core/common/domain/entities/user_entity.dart';

import '../../../structures/tree_node.dart';
import 'collection_entity.dart';

class CategoryEntity {
  final String id;
  final String name;
  final List<String> extensions;
  final UserEntity author;
  final TreeNode<CollectionEntity> collectionTree;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.extensions,
    required this.author,
  }) : collectionTree = TreeNode(
          data: CollectionEntity(
            id: id,
            name: name,
            author: author,
          ),
        );
}
