import '../entities/collection_entity.dart';
import '../repository_interfaces/collection_repository.dart';

class GetCollectionUseCase {
  final CollectionRepository collectionRepository;

  const GetCollectionUseCase({
    required this.collectionRepository,
  });

  Future<CollectionEntity> call({
    required String collectionId,
  }) async {
    return collectionRepository.getCollection(collectionId);
  }
}
