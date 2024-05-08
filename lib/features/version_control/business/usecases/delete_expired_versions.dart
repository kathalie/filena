import '../../../../core/common/business/repository_interfaces/preferences_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/delete_expired_versions_params.dart';
import '../repository_interface/file_version_repository.dart';

class DeleteExpiredVersionsUseCase
    implements UseCase<void, DeleteExpiredVersionsParams> {
  final IFileVersionRepository fileVersionRepository;
  final IPreferencesRepository preferencesRepository;

  const DeleteExpiredVersionsUseCase({
    required this.fileVersionRepository,
    required this.preferencesRepository,
  });

  @override
  Future<void> call(DeleteExpiredVersionsParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
