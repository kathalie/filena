import '../../business/entities/collection_entity.dart';
import '../../business/repository_interfaces/collection_repository.dart';

class CollectionRepositoryImpl implements CollectionRepository {
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
  Future<CollectionEntity> getCollection(String collectionId) {
    // TODO: implement getCollection
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionEntity>> getCollectionsInCategory(String categoryId) {
    // TODO: implement getCollectionsInCategory
    throw UnimplementedError();
  }

  @override
  Future<CollectionEntity> updateCollection(CollectionEntity updatedCollection) {
    // TODO: implement updateCollection
    throw UnimplementedError();
  }
  
}