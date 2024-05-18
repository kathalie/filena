import '../entities/file_version_entity.dart';
import '../repository_interfaces/file_version_repository.dart';

class CreateFileVersionUseCase {
  final FileVersionRepository fileVersionRepository;

  const CreateFileVersionUseCase({
    required this.fileVersionRepository,
  });

  Future<void> call({
    required FileVersionEntity newFileVersion,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
