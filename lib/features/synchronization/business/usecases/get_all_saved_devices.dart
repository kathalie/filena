import '../entities/device_entity.dart';
import '../repository_interfaces/device_repository.dart';

class GetAllSavedDevicesUseCase {
  final DeviceRepository deviceRepository;

  const GetAllSavedDevicesUseCase({
    required this.deviceRepository,
  });

  Future<List<DeviceEntity>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
