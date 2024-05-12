import '../../../../core/use_case/use_case.dart';
import '../params/delete_tag_params.dart';
import '../repository_interfaces/tag_repository.dart';

class DeleteTagUseCase implements UseCase<void, DeleteTagParams> {
  final TagRepository tagRepository;

  const DeleteTagUseCase({
    required this.tagRepository,
  });

  @override
  Future<void> call(DeleteTagParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
