import '../../../../core/use_case/use_case.dart';
import '../params/update_device_params.dart';
import '../repository_interfaces/device_repository.dart';

class UpdateDeviceUseCase implements UseCase<void, UpdateDeviceParams> {
  final DeviceRepository deviceRepository;

  const UpdateDeviceUseCase({
    required this.deviceRepository,
  });

  @override
  Future<void> call(UpdateDeviceParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
