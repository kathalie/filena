import '../../../../core/use_case/use_case.dart';
import '../params/ask_for_connection_params.dart';
import '../repository_interfaces/device_repository.dart';

class AskForConnectionUseCase implements UseCase<void, AskForConnectionParams> {
  final DeviceRepository deviceRepository;

  const AskForConnectionUseCase({
    required this.deviceRepository,
  });

  @override
  Future<void> call(AskForConnectionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
