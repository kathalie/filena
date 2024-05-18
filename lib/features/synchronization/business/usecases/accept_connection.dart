import '../repository_interfaces/device_repository.dart';

class AcceptConnectionUseCase {
  final DeviceRepository deviceRepository;

  const AcceptConnectionUseCase({
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
