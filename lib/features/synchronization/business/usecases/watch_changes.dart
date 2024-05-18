import '../../../version_control/business/repository_interfaces/file_version_repository.dart';

class WatchChangesUseCase {
  final FileVersionRepository fileVersionRepository;

  const WatchChangesUseCase({
    required this.fileVersionRepository,
  });

  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
