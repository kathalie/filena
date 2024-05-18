import '../repository_interfaces/device_repository.dart';

class DenyConnectionUseCase {
  final DeviceRepository deviceRepository;

  const DenyConnectionUseCase({
    required this.deviceRepository,
  });

  Future<void> call({
    required String ipAddress,
    required int port,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
