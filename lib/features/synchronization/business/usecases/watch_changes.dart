import '../../../../core/use_case/use_case.dart';
import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../params/watch_changes_params.dart';

class WatchChangesUseCase implements UseCase<void, WatchChangesParams> {
  final FileVersionRepository fileVersionRepository;

  const WatchChangesUseCase({
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(WatchChangesParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
