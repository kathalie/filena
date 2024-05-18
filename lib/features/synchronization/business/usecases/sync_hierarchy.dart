import '../../../library_management/business/repository_interfaces/collection_repository.dart';
import '../../../library_management/business/repository_interfaces/file_repository.dart';
import '../repository_interfaces/device_repository.dart';

class SyncHierarchyUseCase {
  final DeviceRepository deviceRepository;
  final CollectionRepository collectionRepository;
  final FileRepository fileRepository;

  const SyncHierarchyUseCase({
    required this.deviceRepository,
    required this.collectionRepository,
    required this.fileRepository,
  });

  Future<void> call({
    required String destinationDeviceId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
