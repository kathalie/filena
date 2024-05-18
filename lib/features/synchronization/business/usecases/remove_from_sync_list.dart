import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../repository_interfaces/device_repository.dart';

class RemoveFromSyncListUseCase {
  final DeviceRepository deviceRepository;
  final FileVersionRepository fileVersionRepository;

  const RemoveFromSyncListUseCase({
    required this.deviceRepository,
    required this.fileVersionRepository,
  });

  Future<void> call({
    required List<String> fileVersionIds,
    required String destinationDeviceId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
