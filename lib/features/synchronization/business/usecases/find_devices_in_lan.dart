import '../../../../core/use_case/use_case.dart';
import '../entities/device_entity.dart';
import '../params/find_devices_in_lan_params.dart';

class FindDevicesInLanUseCase implements UseCase<List<DeviceEntity>, FindDevicesInLanParams> {
  @override
  Future<List<DeviceEntity>> call(FindDevicesInLanParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}