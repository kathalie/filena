import 'package:isar/isar.dart';

import '../../../../core/common/data/db/database.dart';
import '../../business/entities/device_entity.dart';
import '../data_source_interfaces/device_data_source.dart';

class DeviceDao implements DeviceDataSource {
  late Future<Isar> db;

  DeviceDao() {
    db = isarDbConnection();
  }

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
