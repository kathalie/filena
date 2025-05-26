enum FileCategory {
  image(['image/']),
  video(['video/']),
  audio(['audio/']),
  document([
    'application/pdf',
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml',
    'application/vnd.ms-excel',
    'application/vnd.openxmlformats-officedocument.spreadsheetml',
    'application/vnd.ms-powerpoint',
    'application/vnd.openxmlformats-officedocument.presentationml',
    'text/',
  ]),
  other([]);

  final List<String> mimeTypePrefixes;

  const FileCategory(this.mimeTypePrefixes);

  static FileCategory fromMimeType(String mimeType) {
      if (mimeType.isEmpty) return FileCategory.other;

      for (final category in FileCategory.values) {
        if (category == FileCategory.other) continue;

        final isSuitableCategory =
        category.mimeTypePrefixes.any((prefix) => mimeType.startsWith(prefix));

        if (isSuitableCategory) return category;
      }

      return FileCategory.other;
  }
}
