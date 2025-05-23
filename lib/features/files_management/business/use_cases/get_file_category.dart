import '../../domain/enums/file_category.dart';

class GetFileCategoryUseCase {
  FileCategory call(String mimeType) {
    if (mimeType.isEmpty) return FileCategory.other;

    for (final category in FileCategory.values) {
      if (category == FileCategory.other) continue;

      final isSuitableCategory =
          category.prefixes.any((prefix) => mimeType.startsWith(prefix));

      if (isSuitableCategory) return category;
    }

    return FileCategory.other;
  }
}
