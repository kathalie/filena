import '../../../../core/use_case/use_case.dart';
import '../params/deny_connection_params.dart';
import '../repository_interfaces/device_repository.dart';

class DenyConnectionUseCase implements UseCase<void, DenyConnectionParams> {
  final DeviceRepository deviceRepository;

  const DenyConnectionUseCase({
    required this.deviceRepository,
  });

  @override
  Future<void> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
