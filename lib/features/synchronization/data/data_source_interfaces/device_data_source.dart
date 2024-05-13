import '../../business/entities/device_entity.dart';

abstract interface class DeviceDataSource {
  Future<List<DeviceEntity>> getAllDevices();

  Future<DeviceEntity> getDevice(String deviceId);

  Future<void> createDevice(DeviceEntity newDevice);

  Future<void> updateDevice(DeviceEntity updatedDevice);

  Future<void> deleteDevice(String deviceId);
}