import '../repository_interfaces/tag_repository.dart';

class UpdateTagUseCase {
  final TagRepository tagRepository;

  const UpdateTagUseCase({
    required this.tagRepository,
  });

  Future<void> call({
    required String name,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
