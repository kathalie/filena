import '../../business/entities/collection_entity.dart';
import '../../business/repository_interfaces/collection_repository.dart';
import '../data_source_interfaces/collection_data_source.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionDataSource collectionDataSource;

  const CollectionRepositoryImpl({
    required this.collectionDataSource,
  });

  @override
  Future<void> createCollection(CollectionEntity newCollection) {
    return collectionDataSource.createCollection(newCollection);
  }

  @override
  Future<void> deleteCollection(String collectionId) {
    return collectionDataSource.deleteCollection(collectionId);
  }

  @override
  Future<CollectionEntity> getCollection(String collectionId) {
    return collectionDataSource.getCollection(collectionId);
  }

  @override
  Future<CollectionEntity> getParentCollection(String categoryId) {
    return collectionDataSource.getParentCollection(categoryId);
  }

  @override
  Future<List<CollectionEntity>> getChildrenCollections(String collectionId) {
    return collectionDataSource.getChildrenCollections(collectionId);
  }

  @override
  Future<void> updateCollection(
    CollectionEntity updatedCollection,
  ) {
    return collectionDataSource.updateCollection(updatedCollection);
  }
}
