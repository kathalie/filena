import '../../../../core/use_case/use_case.dart';
import '../params/accept_connection_params.dart';
import '../repository_interfaces/device_repository.dart';

class AcceptConnectionUseCase implements UseCase<void, AcceptConnectionParams> {
  final IDeviceRepository deviceRepository;

  const AcceptConnectionUseCase({
    required this.deviceRepository,
  });

  @override
  Future<void> call(AcceptConnectionParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
