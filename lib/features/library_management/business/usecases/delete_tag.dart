import '../repository_interfaces/tag_repository.dart';

class DeleteTagUseCase {
  final TagRepository tagRepository;

  const DeleteTagUseCase({
    required this.tagRepository,
  });

  Future<void> call({
    required String tagId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
