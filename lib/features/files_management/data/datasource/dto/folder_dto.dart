class FolderDto {
  final int id;
  final String name;
  final int? parentId;

  const FolderDto({
    required this.id,
    required this.name,
    required this.parentId,
  });
}
