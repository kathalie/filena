import '../repository_interfaces/collection_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/update_collection_params.dart';

class UpdateCollectionUseCase implements UseCase<void, UpdateCollectionParams> {
  final CollectionRepository collectionRepository;

  const UpdateCollectionUseCase({
    required this.collectionRepository,
  });

  @override
  Future<void> call(UpdateCollectionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
