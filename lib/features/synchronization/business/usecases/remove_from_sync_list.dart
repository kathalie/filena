import '../../../../core/use_case/use_case.dart';
import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../params/remove_from_sync_list_params.dart';
import '../repository_interfaces/device_repository.dart';

class RemoveFromSyncListUseCase
    implements UseCase<void, RemoveFromSyncListParams> {
  final IDeviceRepository deviceRepository;
  final IFileVersionRepository fileVersionRepository;

  const RemoveFromSyncListUseCase({
    required this.deviceRepository,
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(RemoveFromSyncListParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
