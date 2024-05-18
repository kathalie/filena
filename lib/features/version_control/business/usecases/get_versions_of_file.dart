import '../entities/file_version_entity.dart';
import '../repository_interfaces/file_version_repository.dart';

class GetVersionsOfFileUseCase {
  final FileVersionRepository fileVersionRepository;

  const GetVersionsOfFileUseCase({
    required this.fileVersionRepository,
  });

  Future<FileVersionEntity> call({
    required String fileId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
