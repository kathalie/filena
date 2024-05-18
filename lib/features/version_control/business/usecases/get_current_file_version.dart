import '../../../library_management/business/repository_interfaces/file_repository.dart';
import '../entities/file_version_entity.dart';
import '../repository_interfaces/file_version_repository.dart';

class GetCurrentFileVersionUseCase {
  final FileVersionRepository fileVersionRepository;
  final FileRepository fileRepository;

  const GetCurrentFileVersionUseCase({
    required this.fileVersionRepository,
    required this.fileRepository,
  });

  Future<FileVersionEntity> call({
    required String fileId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
