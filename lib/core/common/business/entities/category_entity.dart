class CategoryEntity {
  final String id;
  final String name;
  final List<String> extensions;
  final String authorId;
  final String rootCollectionId;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.extensions,
    required this.authorId,
    required this.rootCollectionId,
  });
}
