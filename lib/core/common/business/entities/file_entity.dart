class FileEntity {
  final String id;
  final String name;
  final DateTime dateCreated;
  final String currentFileVersionId;
  final String? description;
  final List<String> tagIds;
  final bool isFavourite;

  const FileEntity({
    required this.id,
    required this.name,
    required this.dateCreated,
    required this.currentFileVersionId,
    this.description,
    this.tagIds = const [],
    this.isFavourite = false,
  });
}
