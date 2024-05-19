import '../models/collection_model.dart';

abstract interface class CollectionDataSource {
  Future<List<FileCollection>> getChildrenCollections(String collectionId);

  Future<FileCollection> getCollection(String collectionId);

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
