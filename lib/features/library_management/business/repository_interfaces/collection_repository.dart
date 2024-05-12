import '../entities/collection_entity.dart';

abstract interface class CollectionRepository {
  Future<CollectionEntity> getCollection(String collectionId);

  Future<List<CollectionEntity>> getCollectionsInCategory(String categoryId);

  Future<void> createCollection(CollectionEntity newCollection);

  Future<CollectionEntity> updateCollection(CollectionEntity updatedCollection);

  Future<void> deleteCollection(String collectionId);
}
