import '../../business/entities/collection_entity.dart';
import '../../business/repository_interfaces/collection_repository.dart';
import '../data_source_interfaces/collection_data_source.dart';
import '../models/collection_model.dart';

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionDataSource collectionDataSource;

  const CollectionRepositoryImpl({
    required this.collectionDataSource,
  });

  CollectionEntity _toEntity(FileCollection collectionModel) {
    final childCollectionIds = collectionModel.childCollections.map(
      (model) => model.id.toString(),
    );

    final childFilesIds = collectionModel.files.map(
      (model) => model.id.toString(),
    );

    return CollectionEntity(
      id: collectionModel.id.toString(),
      name: collectionModel.name,
      childCollectionIds: childCollectionIds.toList(),
      fileIds: childFilesIds.toList(),
    );
  }

  @override
  Future<void> createCollection({
    required String newCollectionName,
    required String parentCollectionId,
  }) async {
    return await collectionDataSource.createCollection(
      newCollectionName: newCollectionName,
      parentCollectionId: parentCollectionId,
    );
  }

  @override
  Future<void> deleteCollection(String collectionId) {
    return collectionDataSource.deleteCollection(collectionId);
  }

  @override
  Future<CollectionEntity> getCollection(String collectionId) async {
    final collectionModel =
        await collectionDataSource.getCollection(collectionId);

    return _toEntity(collectionModel);
  }

  @override
  Future<List<CollectionEntity>> getChildrenCollections(
    String collectionId,
  ) async {
    final collectionModels =
        await collectionDataSource.getChildrenCollections(collectionId);
    return collectionModels.map((model) => _toEntity(model)).toList();
  }

  @override
  Future<void> updateCollection({
    required String collectionId,
    required String newName,
  }) async {
    await collectionDataSource.updateCollection(
      collectionId: collectionId,
      newName: newName,
    );
  }
}
