import '../repository_interfaces/collection_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/create_collection_params.dart';

class CreateCollectionUseCase implements UseCase<void, CreateCollectionParams> {
  final ICollectionRepository collectionRepository;

  const CreateCollectionUseCase({
    required this.collectionRepository,
  });

  @override
  Future<void> call(CreateCollectionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
