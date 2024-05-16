import 'package:isar/isar.dart';

import '../../business/entities/types/storage_location.dart';

part 'user_model.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  late String email;

  late String username;

  late String passwordHash;

  int versionsLifetimeInDays = 30;

  bool encryptFiles = false;

  @enumerated
  StorageLocation storageLocation = StorageLocation.personalDevice;
}
