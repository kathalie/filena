class FileDto {
  final String id;
  final bool isPrioritized;
  final int currentVersion;
  final String mimeType;

  const FileDto({
    required this.id,
    required this.isPrioritized,
    required this.currentVersion,
    required this.mimeType,
  });
}
