import 'package:isar/isar.dart';

import '../../../../core/common/data/db/database.dart';
import '../../business/entities/collection_entity.dart';
import '../data_source_interfaces/collection_data_source.dart';
import '../models/collection_model.dart';

class CollectionDao implements CollectionDataSource {
  late Future<Isar> db;

  CollectionDao() {
    db = isarDbConnection();
  }

  @override
  Future<void> createCollection(CollectionEntity newCollection) async {
    final isar = await db;

    final newCollectionModel = FilesCollection()
      ..name = newCollection.name;

    isar.writeTxnSync(() => isar.filesCollections.putSync(newCollectionModel));
  }

  @override
  Future<void> deleteCollection(String collectionId) {
    // TODO: implement deleteCollection
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionEntity>> getChildrenCollections(String collectionId) {
    // TODO: implement getChildrenCollections
    throw UnimplementedError();
  }

  @override
  Future<CollectionEntity> getCollection(String collectionId) {
    // TODO: implement getCollection
    throw UnimplementedError();
  }

  @override
  Future<CollectionEntity> getParentCollection(String categoryId) {
    // TODO: implement getParentCollection
    throw UnimplementedError();
  }

  @override
  Future<void> updateCollection(CollectionEntity updatedCollection) {
    // TODO: implement updateCollection
    throw UnimplementedError();
  }
}
