class CollectionEntity {
  final String id;
  final String name;
  final List<String> childCollectionIds;
  final List<String> fileIds;

  const CollectionEntity({
    required this.id,
    required this.name,
    this.childCollectionIds = const [],
    this.fileIds = const [],
  });
}
