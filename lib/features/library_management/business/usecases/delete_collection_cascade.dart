import '../repository_interfaces/collection_repository.dart';

class DeleteCollectionCascadeUseCase {
  final CollectionRepository collectionRepository;

  const DeleteCollectionCascadeUseCase({
    required this.collectionRepository,
  });

  Future<void> call({
    required String collectionId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
