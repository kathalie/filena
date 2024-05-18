import '../repository_interfaces/file_repository.dart';

class MoveFileUseCase {
  final FileRepository fileRepository;

  const MoveFileUseCase({
    required this.fileRepository,
  });

  Future<void> call({
    required String fileId,
    required String destinationCollectionId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
