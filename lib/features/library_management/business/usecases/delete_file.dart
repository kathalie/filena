import '../repository_interfaces/file_repository.dart';

class DeleteFileUseCase {
  final FileRepository fileRepository;

  const DeleteFileUseCase({
    required this.fileRepository,
  });

  Future<void> call({
    required String fileId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
