import '../../../version_control/business/entities/file_version_entity.dart';
import '../../../version_control/business/repository_interfaces/file_version_repository.dart';

class BothModifiedUseCase {
  final FileVersionRepository fileVersionRepository;

  const BothModifiedUseCase({
    required this.fileVersionRepository,
  });

  Future<void> call({
    required FileVersionEntity remoteFileVersion,
    required String localFileVersionId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
