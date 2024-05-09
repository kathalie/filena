import '../entities/device_entity.dart';

abstract class IDeviceRepository {
   Future<List<DeviceEntity>> getAllDevices();

   Future<DeviceEntity> getDevice(String deviceId);

   Future<void> createDevice(DeviceEntity newDevice);

   Future<void> updateDevice(DeviceEntity updatedDevice);

   Future<void> deleteDevice(String deviceId);
}