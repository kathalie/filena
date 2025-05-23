class FileCreateDto {
  final String name;
  final String hash;
  final String mimeType;
  final List<double> embeddings;
  final int? parentFolderId;

  const FileCreateDto({
    required this.name,
    required this.hash,
    required this.mimeType,
    required this.embeddings,
    required this.parentFolderId,
  });
}
