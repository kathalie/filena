import '../../../../core/use_case/use_case.dart';
import '../../../user/business/repository_interfaces/user_repository.dart';
import '../params/delete_expired_versions_params.dart';
import '../repository_interfaces/file_version_repository.dart';

class DeleteExpiredVersionsUseCase
    implements UseCase<void, DeleteExpiredVersionsParams> {
  final FileVersionRepository fileVersionRepository;
  final UserRepository userRepository;

  const DeleteExpiredVersionsUseCase({
    required this.fileVersionRepository,
    required this.userRepository,
  });

  @override
  Future<void> call(DeleteExpiredVersionsParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
