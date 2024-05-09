import '../../../../core/use_case/use_case.dart';
import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../params/sync_storage_elements_params.dart';
import '../repository_interfaces/device_repository.dart';

class SyncStorageElementsUseCase
    implements UseCase<void, SyncStorageElementsParams> {
  final IDeviceRepository deviceRepository;
  final IFileVersionRepository fileVersionRepository;

  const SyncStorageElementsUseCase({
    required this.deviceRepository,
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(SyncStorageElementsParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
