import '../repository_interfaces/collection_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/delete_collection_cascade_params.dart';

class DeleteCollectionCascadeUseCase
    implements UseCase<void, DeleteCollectionCascadeParams> {
  final CollectionRepository collectionRepository;

  const DeleteCollectionCascadeUseCase({
    required this.collectionRepository,
  });

  @override
  Future<void> call(DeleteCollectionCascadeParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
