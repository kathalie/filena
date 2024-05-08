class CategoryEntity {
  final String id;
  final String name;
  final List<String> extensions;
  final String rootCollectionId;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.extensions,
    required this.rootCollectionId,
  });
}
