import 'package:isar/isar.dart';

import '../../../version_control/data/models/file_version_model.dart';

part 'device_model.g.dart';

@collection
class Device {
  Id id = Isar.autoIncrement;

  late String name;

  late String ipAddress;

  late int port;

  final fileVersionsToSync = IsarLinks<FileVersion>();
}