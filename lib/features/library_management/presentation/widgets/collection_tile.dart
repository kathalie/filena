import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../business/entities/collection_entity.dart';
import '../pages/collection_page.dart';

class CollectionTile extends ConsumerWidget {
  final List<String> allowedExtensions;
  final CollectionEntity collection;

  const CollectionTile({
    required this.allowedExtensions,
    required this.collection,
    super.key,
  });

  _goToCollection(BuildContext context, CollectionEntity collection) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollectionPage(
          currentCollectionId: collection.id,
          allowedExtensions: allowedExtensions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => _goToCollection(context, collection),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.folder),
          Text(collection.name),
        ],
      ),
    );
  }
}
