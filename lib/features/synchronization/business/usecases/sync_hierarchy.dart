import '../../../../core/common/business/repository_interfaces/collection_repository.dart';
import '../../../../core/common/business/repository_interfaces/file_repository.dart';
import '../../../../core/use_case/use_case.dart';
import '../params/sync_hierarchy_params.dart';
import '../repository_interfaces/device_repository.dart';

class SyncHierarchyUseCase implements UseCase<void, SyncHierarchyParams> {
  final IDeviceRepository deviceRepository;
  final ICollectionRepository collectionRepository;
  final IFileRepository fileRepository;

  const SyncHierarchyUseCase({
    required this.deviceRepository,
    required this.collectionRepository,
    required this.fileRepository,
  });

  @override
  Future<void> call(SyncHierarchyParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
