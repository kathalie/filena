import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di/repositories/repositories_di.dart';
import '../../business/entities/collection_entity.dart';
import '../../business/repository_interfaces/collection_repository.dart';

class AddCollectionButton extends ConsumerWidget {
  const AddCollectionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionRepository = ref.watch(collectionRepositoryProvider);

    return IconButton(
      onPressed: () async => await handlePress(collectionRepository),
      icon: const Icon(Icons.add),
    );
  }

  Future<void> handlePress(CollectionRepository collectionRepository) async {
    await collectionRepository.createCollection(
      const CollectionEntity(
        id: '',
        name: 'Animals',
      ),
    );
  }
}
