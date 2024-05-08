class CollectionEntity {
  final String id;
  final String name;
  final String authorId;
  final List<String> childCollectionIds;
  final List<String> fileIds;

  const CollectionEntity({
    required this.id,
    required this.name,
    required this.authorId,
    this.childCollectionIds = const [],
    this.fileIds = const [],
  });
}
