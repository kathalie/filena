import '../../../../core/use_case/use_case.dart';
import '../params/delete_device_params.dart';
import '../repository_interfaces/device_repository.dart';

class DeleteDeviceUseCase implements UseCase<void, DeleteDeviceParams> {
  final DeviceRepository deviceRepository;

  const DeleteDeviceUseCase({
    required this.deviceRepository,
  });

  @override
  Future<void> call(DeleteDeviceParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
