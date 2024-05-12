import '../../business/entities/device_entity.dart';
import '../../business/repository_interfaces/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  @override
  Future<void> createDevice(DeviceEntity newDevice) {
    // TODO: implement createDevice
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDevice(String deviceId) {
    // TODO: implement deleteDevice
    throw UnimplementedError();
  }

  @override
  Future<List<DeviceEntity>> getAllDevices() {
    // TODO: implement getAllDevices
    throw UnimplementedError();
  }

  @override
  Future<DeviceEntity> getDevice(String deviceId) {
    // TODO: implement getDevice
    throw UnimplementedError();
  }

  @override
  Future<void> updateDevice(DeviceEntity updatedDevice) {
    // TODO: implement updateDevice
    throw UnimplementedError();
  }
}