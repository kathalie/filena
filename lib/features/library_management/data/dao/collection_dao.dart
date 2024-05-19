import 'package:isar/isar.dart';

import '../../../../core/db/database.dart';
import '../data_source_interfaces/collection_data_source.dart';
import '../models/collection_model.dart';

class CollectionDao implements CollectionDataSource {
  late Future<Isar> db;

  CollectionDao() {
    db = isarDbConnection();
  }

  @override
  Future<void> createCollection({
    required String newCollectionName,
    required String parentCollectionId,
  }) async {
    final isar = await db;

    final parentCollection =
        await isar.fileCollections.get(int.parse(parentCollectionId));

    if (parentCollection == null) {
      throw ArgumentError('Wrong parent collection id!');
    }

    final newCollection = FileCollection()..name = newCollectionName;

    parentCollection.childCollections.add(newCollection);

    await isar.writeTxn(() async {
      await isar.fileCollections.put(newCollection);
      await parentCollection.childCollections.save();
    });
  }

  @override
  Future<void> deleteCollection(String collectionId) {
    // TODO: implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<List<FileCollection>> getChildrenCollections(
    String collectionId,
  ) async {
    final isar = await db;

    final childCollections =
        (await isar.fileCollections.get(int.parse(collectionId)))
            ?.childCollections
            .toList();

    if (childCollections == null) {
      throw ArgumentError('Wrong collection id!');
    }

    return childCollections;
  }

  @override
  Future<FileCollection> getCollection(String collectionId) async {
    final isar = await db;

    final collection = await isar.fileCollections.get(int.parse(collectionId));

    if (collection == null) {
      throw ArgumentError('Wrong collection id!');
    }

    return collection;
  }

  @override
  Future<void> updateCollection({
    required String collectionId,
    required String newName,
  }) {
    // TODO: implement updateCollection
    throw UnimplementedError();
  }
}
