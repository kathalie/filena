class FileDto {
  final int id;
  final bool isFavourite;
  final int currentVersion;
  final String mimeType;

  const FileDto({
    required this.id,
    required this.isFavourite,
    required this.currentVersion,
    required this.mimeType,
  });
}
