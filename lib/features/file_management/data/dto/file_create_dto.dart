class FileCreateDto {
  final String id;
  final String hash;
  final String mimeType;
  final List<double> embeddings;

  const FileCreateDto({
    required this.id,
    required this.hash,
    required this.mimeType,
    required this.embeddings,
  });
}
