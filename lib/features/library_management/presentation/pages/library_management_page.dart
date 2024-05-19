import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/presentation/widgets/progress_indicator.dart';
import '../state_management/category_page_states.dart';
import '../widgets/category_tile.dart';

class LibraryManagementPage extends ConsumerWidget {
  const LibraryManagementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesFuture = ref.watch(allCategoriesProvider);

    return categoriesFuture.when(
      data: (categories) => GridView.extent(
        maxCrossAxisExtent: 500.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        padding: const EdgeInsets.all(24.0),
        children: [
          for (final category in categories)
            CategoryTile(
              category: category,
            ),
        ],
      ),
      error: (Object error, StackTrace stackTrace) => Text(error.toString()),
      loading: () => const LoadingIndicator(),
    );
  }
}