import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;

  String? email;

  String? username;

  String? passwordHash;

  int versionsLifetimeInDays = 30;

  bool encryptFiles = false;
}