import '../../business/entities/collection_entity.dart';

abstract interface class CollectionDataSource {
  Future<CollectionEntity> getParentCollection(String categoryId);

  Future<List<CollectionEntity>> getChildrenCollections(String collectionId);

  Future<CollectionEntity> getCollection(String collectionId);

  Future<void> createCollection(CollectionEntity newCollection);

  Future<void> updateCollection(CollectionEntity updatedCollection);

  Future<void> deleteCollection(String collectionId);
}
