import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../business/entities/collection_entity.dart';
import '../../business/entities/file_entity.dart';

part 'collection_page_states.g.dart';

@riverpod
Future<List<CollectionEntity>> childCollections(
  ChildCollectionsRef ref,
  String parentCollectionId,
) async {
  return ref.watch(getCollectionsWithinCollectionUsecaseProvider)(
    parentCollectionId: parentCollectionId,
  );
}

@riverpod
Future<List<FileEntity>> childFiles(
  ChildFilesRef ref,
  String parentCollectionId,
) async {
  return ref.watch(getFilesWithinCollectionUsecaseProvider)(
    parentCollectionId: parentCollectionId,
  );
}

@riverpod
Future<CollectionEntity> currentCollection(
  CurrentCollectionRef ref,
  String collectionId,
) async {
  return ref.watch(gettCollectionUseCaseProvider)(
    collectionId: collectionId,
  );
}
