import 'package:flutter/material.dart';

import '../../business/entities/category_entity.dart';
import '../pages/collection_page.dart';

class CategoryTile extends StatelessWidget {
  final CategoryEntity category;

  const CategoryTile({
    required this.category,
    super.key,
  });

  void _goToCollectionsPage(
      BuildContext context,
      CategoryEntity currentCategory,
      ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollectionPage(
          currentCollectionId: currentCategory.rootCollectionId,
          allowedExtensions: currentCategory.extensions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _goToCollectionsPage(context, category);
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
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
    );
  }
}
