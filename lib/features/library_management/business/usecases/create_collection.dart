import '../repository_interfaces/collection_repository.dart';

class CreateCollectionUseCase {
  final CollectionRepository collectionRepository;

  const CreateCollectionUseCase({
    required this.collectionRepository,
  });

  Future<void> call({
    required String name,
    required String parentCollectionId,
  }) async {
    collectionRepository.createCollection(
      newCollectionName: name,
      parentCollectionId: parentCollectionId,
    );
  }
}
