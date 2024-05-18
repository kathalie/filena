import '../repository_interfaces/device_repository.dart';

class DeleteDeviceUseCase {
  final DeviceRepository deviceRepository;

  const DeleteDeviceUseCase({
    required this.deviceRepository,
  });

  Future<void> call({
    required String deviceId,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
