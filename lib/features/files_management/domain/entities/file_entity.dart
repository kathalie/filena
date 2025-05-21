import '../enums/file_category.dart';
import 'file_details_entity.dart';

class FileEntity {
  final int id;
  final bool isFavourite;
  final FileDetailsEntity fileDetails;

  const FileEntity({
    required this.id,
    required this.isFavourite,
    required this.fileDetails,
  });
}

extension on FileEntity {
  FileCategory get category {
    if (fileDetails.mimeType.isEmpty) {
      return FileCategory.other;
    }

    for (final category in FileCategory.values) {
      if (category == FileCategory.other) continue;

      final isSuitableCategory = category.prefixes
          .any((prefix) => fileDetails.mimeType.startsWith(prefix));

      if (isSuitableCategory) {
        return category;
      }
    }

    return FileCategory.other;
  }
}
