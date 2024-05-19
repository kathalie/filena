import '../entities/collection_entity.dart';

abstract interface class CollectionRepository {
  Future<CollectionEntity> getCollection(String collectionId);

  Future<List<CollectionEntity>> getChildrenCollections(String collectionId);

  Future<void> createCollection({
    required String newCollectionName,
    required String parentCollectionId,
  });

  Future<void> updateCollection({
    required String collectionId,
    required String newName,
  });

  Future<void> deleteCollection(String collectionId);
}
