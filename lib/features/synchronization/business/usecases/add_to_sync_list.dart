import '../../../../core/use_case/use_case.dart';
import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../repository_interfaces/device_repository.dart';

class AddToSyncListUseCase implements UseCase<void, AddToSyncListUseCase> {
  final IDeviceRepository deviceRepository;
  final IFileVersionRepository fileVersionRepository;

  const AddToSyncListUseCase({
    required this.deviceRepository,
    required this.fileVersionRepository,
  });

  @override
  Future<void> call(AddToSyncListUseCase params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
