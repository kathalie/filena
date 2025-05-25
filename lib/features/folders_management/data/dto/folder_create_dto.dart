class FolderCreateDto {
  final String name;
  final bool needsConfirmation;
  final int? parentFolderId;
  final List<double> embeddings;

  const FolderCreateDto({
    required this.name,
    required this.needsConfirmation,
    required this.parentFolderId,
    required this.embeddings,
  });
}
