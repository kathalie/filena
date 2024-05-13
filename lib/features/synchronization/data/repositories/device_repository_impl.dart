import '../../business/entities/device_entity.dart';
import '../../business/repository_interfaces/device_repository.dart';
import '../data_source_interfaces/device_data_source.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final DeviceDataSource deviceDataSource;

  const DeviceRepositoryImpl({
    required this.deviceDataSource,
  });

  @override
  Future<void> createDevice(DeviceEntity newDevice) {
    return deviceDataSource.createDevice(newDevice);
  }

  @override
  Future<void> deleteDevice(String deviceId) {
    return deviceDataSource.deleteDevice(deviceId);
  }

  @override
  Future<List<DeviceEntity>> getAllDevices() {
    return deviceDataSource.getAllDevices();
  }

  @override
  Future<DeviceEntity> getDevice(String deviceId) {
    return deviceDataSource.getDevice(deviceId);
  }

  @override
  Future<void> updateDevice(DeviceEntity updatedDevice) {
    return deviceDataSource.updateDevice(updatedDevice);
  }
}
