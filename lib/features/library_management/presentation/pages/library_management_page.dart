import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../../../core/presentation/widgets/progress_indicator.dart';
import '../../business/entities/category_entity.dart';
import '../widgets/category_tile.dart';
import 'collection_page.dart';

class LibraryManagementPage extends ConsumerStatefulWidget {
  const LibraryManagementPage({super.key});

  @override
  ConsumerState createState() => _LibraryManagementPageState();
}

class _LibraryManagementPageState extends ConsumerState<LibraryManagementPage> {
  List<CategoryEntity>? _categories;

  void _loadCategories() {
    ref.watch(getCategoriesUseCaseProvider)().then((value) {
      setState(() {
        _categories = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadCategories();

    final categories = _categories;

    return GridView.extent(
      maxCrossAxisExtent: 500.0,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      padding: const EdgeInsets.all(24.0),
      children: [
        if (categories == null)
          const LoadingIndicator()
        else
          for (final category in categories)
            CategoryTile(
              category: category,
            ),
      ],
    );
  }
}
