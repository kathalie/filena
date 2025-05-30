class FileDto {
  final int id;
  final String storageKey;
  final bool isPrioritized;
  final int currentVersion;
  final String mimeType;

  const FileDto({
    required this.id,
    required this.storageKey,
    required this.isPrioritized,
    required this.currentVersion,
    required this.mimeType,
  });
}
