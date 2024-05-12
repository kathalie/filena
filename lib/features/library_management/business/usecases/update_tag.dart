import '../../../../core/use_case/use_case.dart';
import '../params/update_tag_params.dart';
import '../repository_interfaces/tag_repository.dart';

class UpdateTagUseCase implements UseCase<void, UpdateTagParams> {
  final TagRepository tagRepository;

  const UpdateTagUseCase({
    required this.tagRepository,
  });

  @override
  Future<void> call(UpdateTagParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
