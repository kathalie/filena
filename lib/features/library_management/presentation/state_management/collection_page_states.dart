import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../business/entities/collection_entity.dart';

part 'collection_page_states.g.dart';

@riverpod
class CollectionsWithinCollection extends _$CollectionsWithinCollection {
  @override
  List<CollectionEntity>? build() => null;

  void setCollections(String collectionId) async {
    state = await ref.watch(getCollectionsWithinCollectionUsecaseProvider)(
      parentCollectionId: collectionId,
    );
  }
}
