import '../entities/collection_entity.dart';

abstract class ICollectionRepository {
  Future<CollectionEntity> getCollection(String collectionId);

  Future<List<CollectionEntity>> getCollectionsInCategory(String categoryId);

  Future<void> createCollection(CollectionEntity newCollection);

  Future<CollectionEntity> updateCollection(CollectionEntity updatedCollection);

  Future<void> deleteCollection(String collectionId);
}
