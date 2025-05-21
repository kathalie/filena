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

  final List<String> prefixes;

  const FileCategory(this.prefixes);
}
