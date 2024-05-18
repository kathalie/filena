import '../../../user/business/repository_interfaces/user_repository.dart';
import '../repository_interfaces/file_version_repository.dart';

class DeleteExpiredVersionsUseCase {
  final FileVersionRepository fileVersionRepository;
  final UserRepository userRepository;

  const DeleteExpiredVersionsUseCase({
    required this.fileVersionRepository,
    required this.userRepository,
  });

  Future<void> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
