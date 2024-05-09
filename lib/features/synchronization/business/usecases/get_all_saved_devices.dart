import '../../../../core/use_case/use_case.dart';
import '../entities/device_entity.dart';
import '../repository_interfaces/device_repository.dart';

class GetAllSavedDevicesUseCase
    implements UseCase<List<DeviceEntity>, GetAllSavedDevicesUseCase> {
  final IDeviceRepository deviceRepository;

  const GetAllSavedDevicesUseCase({
    required this.deviceRepository,
  });

  @override
  Future<List<DeviceEntity>> call(GetAllSavedDevicesUseCase params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
