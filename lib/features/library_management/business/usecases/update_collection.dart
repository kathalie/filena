import '../repository_interfaces/collection_repository.dart';

class UpdateCollectionUseCase {
  final CollectionRepository collectionRepository;

  const UpdateCollectionUseCase({
    required this.collectionRepository,
  });

  Future<void> call({
    required String collectionId,
    String? newName,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
