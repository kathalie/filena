import '../enums/file_category.dart';

class FileDetailsEntity {
  final String name;
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;
  final String mimeType;

  FileDetailsEntity({
    required this.name,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    required this.mimeType,
  });
}

extension FileDetailsEntityCategory on FileDetailsEntity {
  FileCategory get category {
    if (mimeType.isEmpty) {
      return FileCategory.other;
    }

    for (final category in FileCategory.values) {
      if (category == FileCategory.other) continue;

      final isSuitableCategory = category.prefixes
          .any((prefix) => mimeType.startsWith(prefix));

      if (isSuitableCategory) {
        return category;
      }
    }

    return FileCategory.other;
  }
}
