import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecases/library_management_usecases_di.dart';
import '../../business/entities/collection_entity.dart';
import '../../business/entities/file_entity.dart';

// part 'collection_page_states.g.dart';

// @riverpod
// class CollectionsWithinCollection extends _$CollectionsWithinCollection {
//   @override
//   List<CollectionEntity>? build() => null;
//
//   Future<void> setCollections(String collectionId) async {
//     state = await ref.watch(getCollectionsWithinCollectionUsecaseProvider)(
//       parentCollectionId: collectionId,
//     );
//   }
// }
//
// @riverpod
// class FilesWithinCollection extends _$FilesWithinCollection {
//   @override
//   List<FileEntity>? build() => null;
//
//   Future<void> setFiles(String collectionId) async {
//     state = await ref.watch(getFilesWithinCollectionUsecaseProvider)(
//       parentCollectionId: collectionId,
//     );
//   }
// }
