import '../../business/entities/collection_entity.dart';
import '../data_source_interfaces/collection_data_source.dart';

class CollectionDao implements CollectionDataSource {
  @override
  Future<void> createCollection(CollectionEntity newCollection) {
    // TODO: implement createCollection
    throw UnimplementedError();
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
