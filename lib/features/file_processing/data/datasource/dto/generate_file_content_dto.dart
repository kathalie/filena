import 'dart:typed_data';

import '../../../../files_management/domain/enums/file_category.dart';

class FileContentInfoPromptDto {
  static List<FileCategory> supportedFileCategories = [FileCategory.image, FileCategory.document];

  final FileCategory fileCategory;
  final Stream<List<Uint8List>> content;

  late final String? prompt;

  FileContentInfoPromptDto({
    required this.fileCategory,
    required this.content,
  }) {
    final categoryName = fileCategory.toString();

    prompt = !supportedFileCategories.contains(fileCategory) ? null :
        'Extract up to 7 keywords in English that best describe this $categoryName for folder classification. '
            'Focus on specific, descriptive terms, avoiding generic words.';
  }
}
