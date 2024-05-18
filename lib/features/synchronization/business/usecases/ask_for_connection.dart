import '../repository_interfaces/device_repository.dart';

class AskForConnectionUseCase {
  final DeviceRepository deviceRepository;

  const AskForConnectionUseCase({
    required this.deviceRepository,
  });

  Future<void> call({
    required String ipAddress,
    required String port,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
