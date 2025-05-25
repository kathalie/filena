class FileCreateDto {
  final String hash;
  final String mimeType;
  final List<double> embeddings;

  const FileCreateDto({
    required this.hash,
    required this.mimeType,
    required this.embeddings,
  });
}
