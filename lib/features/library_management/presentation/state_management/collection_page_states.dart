import 'package:file_picker/file_picker.dart';
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
    required PlatformFile platformFile,
  }) async {
    final bytes = platformFile.bytes;

    if (bytes == null) {
      throw ArgumentError('Null file content!');
    }

    final lastModified = await platformFile.xFile.lastModified();

    await ref.watch(addFileUsecaseProvider)(
      parentCollectionId: parentCollectionId,
      name: platformFile.name,
      dateCreated: lastModified,
      sizeInBytes: platformFile.size,
      content: bytes,
      description: null,
      tagIds: [],
      isFavourite: false,
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
