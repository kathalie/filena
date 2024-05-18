import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../repository_interfaces/device_repository.dart';

class SyncStorageElementsUseCase {
  final DeviceRepository deviceRepository;
  final FileVersionRepository fileVersionRepository;

  const SyncStorageElementsUseCase({
    required this.deviceRepository,
    required this.fileVersionRepository,
  });

  Future<void> call({
    required String destinationDeviceId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
