import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../business/entities/collection_entity.dart';
import '../../business/entities/file_entity.dart';

part 'collection_page_states.g.dart';

@riverpod
class ChildCollections extends _$ChildCollections {
  @override
  Future<List<CollectionEntity>> build(String parentCollectionId) async {
    return await ref.watch(getCollectionsWithinCollectionUsecaseProvider)(
      parentCollectionId: parentCollectionId,
    );
  }

  Future<void> addCollection({
    required String parentCollectionId,
    required String name,
  }) async {
    await ref.watch(createCollectionUsecaseProvider)(
      name: name,
      parentCollectionId: parentCollectionId,
    );

    ref.invalidateSelf();
  }
}

@riverpod
class ChildFiles extends _$ChildFiles {
  @override
  Future<List<FileEntity>> build(String parentCollectionId) async {
    return ref.watch(getFilesWithinCollectionUsecaseProvider)(
      parentCollectionId: parentCollectionId,
    );
  }

  Future<void> addFile({
    required String parentCollectionId,
    required String name,
    required DateTime dateCreated,
    required int sizeInBytes,
    required Uint8List content,
    required List<String> tagIds,
    required bool isFavourite,
    String? description,
  }) async {
    await ref.watch(addFileUsecaseProvider)(
      parentCollectionId: parentCollectionId,
      name: name,
      dateCreated: dateCreated,
      sizeInBytes: sizeInBytes,
      content: content,
      description: description,
      tagIds: tagIds,
      isFavourite: isFavourite,
    );

    ref.invalidateSelf();
  }
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