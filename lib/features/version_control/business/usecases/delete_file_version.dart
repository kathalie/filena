import '../repository_interfaces/file_version_repository.dart';

class DeleteFileVersionUseCase {
  final FileVersionRepository fileVersionRepository;

  const DeleteFileVersionUseCase({
    required this.fileVersionRepository,
  });

  Future<void> call({
    required String fileVersionId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
