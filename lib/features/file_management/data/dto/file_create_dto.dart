class FileCreateDto {
  final String storageKey;
  final String hash;
  final String mimeType;
  final List<double> embeddings;

  const FileCreateDto({
    required this.storageKey,
    required this.hash,
    required this.mimeType,
    required this.embeddings,
  });
}
