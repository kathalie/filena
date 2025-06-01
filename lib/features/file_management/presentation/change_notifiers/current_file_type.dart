import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/helpers/file_category.dart';

class FileCategoryNotifier extends StateNotifier<FileCategory?> {
  FileCategoryNotifier() : super(null);

  void update(FileCategory? newCategory) {
    state = newCategory;
  }
}

final selectedFileCategoryProvider =
StateNotifierProvider<FileCategoryNotifier, FileCategory?>((ref) {
  return FileCategoryNotifier();
});