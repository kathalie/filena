import '../repository_interfaces/device_repository.dart';

class UpdateDeviceUseCase {
  final DeviceRepository deviceRepository;

  const UpdateDeviceUseCase({
    required this.deviceRepository,
  });

  Future<void> call({
    required String deviceId,
    required String? ipAddress,
    required String? port,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
