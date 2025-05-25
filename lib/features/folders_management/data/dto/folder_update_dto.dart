class FolderUpdateDto {
  final int id;
  final String name;
  final List<double> embeddings;

  FolderUpdateDto({
    required this.id,
    required this.name,
    required this.embeddings,
  });
}
