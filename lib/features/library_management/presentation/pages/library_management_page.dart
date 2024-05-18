import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../business/entities/category_entity.dart';
import 'collection_page.dart';

class LibraryManagementPage extends ConsumerStatefulWidget {
  const LibraryManagementPage({super.key});

  @override
  ConsumerState createState() => _LibraryManagementPageState();
}

class _LibraryManagementPageState extends ConsumerState<LibraryManagementPage> {
  List<CategoryEntity>? _categories;

  @override
  Widget build(BuildContext context) {
    ref.watch(getCategoriesUseCaseProvider)().then(
          (value) => {
            setState(() {
              _categories = value;
            }),
          },
        );

    final categories = _categories;

    return GridView.count(
      mainAxisSpacing: 36.0,
      crossAxisSpacing: 36.0,
      padding: const EdgeInsets.all(64.0),
      crossAxisCount: 2,
      children: [
        if (categories == null)
          const CircularProgressIndicator()
        else
          for (final category in categories)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CollectionPage(
                      category: category,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
