class FileDto {
  final int id;
  final String name;
  final String mimeType;
  final bool isFavourite;

  const FileDto({
    required this.id,
    required this.name,
    required this.mimeType,
    required this.isFavourite,
  });
}
