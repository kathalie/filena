import '../entities/collection_entity.dart';
import '../repository_interfaces/collection_repository.dart';

class GetCollectionsWithinCollectionUseCase {
  final CollectionRepository collectionRepository;

  const GetCollectionsWithinCollectionUseCase({
    required this.collectionRepository,
  });

  Future<List<CollectionEntity>> call({
    required String parentCollectionId,
  }) {
    return collectionRepository.getChildrenCollections(parentCollectionId);
  }
}
