import '../repository_interfaces/tag_repository.dart';

class CreateTagUseCase {
  final TagRepository tagRepository;

  const CreateTagUseCase({
    required this.tagRepository,
  });

  Future<void> call({
    required String tagName,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
