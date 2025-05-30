class FileCreateDto {
  final String storageKey;
  final String name;
  final String mimeType;
  final List<double> embeddings;

  const FileCreateDto({
    required this.storageKey,
    required this.name,
    required this.mimeType,
    required this.embeddings,
  });
}
