import '../../../../core/use_case/use_case.dart';
import '../params/create_tag_params.dart';
import '../repository_interfaces/tag_repository.dart';

class CreateTagUseCase implements UseCase<void, CreateTagParams> {
  final TagRepository tagRepository;

  const CreateTagUseCase({
    required this.tagRepository,
  });

  @override
  Future<void> call(CreateTagParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
