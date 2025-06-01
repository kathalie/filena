enum FileCategory {
  image(['image/'], 'Images'),
  video(['video/'], 'Movies'),
  audio(['audio/'], 'Music'),
  document(
    [
      'application/pdf',
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml',
      'application/vnd.ms-excel',
      'application/vnd.openxmlformats-officedocument.spreadsheetml',
      'application/vnd.ms-powerpoint',
      'application/vnd.openxmlformats-officedocument.presentationml',
      'text/',
    ],
    'Documents',
  ),
  other([], 'Other');

  final List<String> mimeTypePrefixes;
  final String caption;

  const FileCategory(this.mimeTypePrefixes, this.caption);

  static FileCategory fromMimeType(String mimeType) {
    if (mimeType.isEmpty) return FileCategory.other;

    for (final category in FileCategory.values) {
      if (category == FileCategory.other) continue;

      final isSuitableCategory = category.mimeTypePrefixes
          .any((prefix) => mimeType.startsWith(prefix));

      if (isSuitableCategory) return category;
    }

    return FileCategory.other;
  }

  static List<String> get allPrefixes {
    return values.expand((c) => c.mimeTypePrefixes).toList();
  }
}
