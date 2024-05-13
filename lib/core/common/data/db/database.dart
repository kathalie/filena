import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/user_model.dart';

Future<Isar> isarDbConnection() async {
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [UserSchema],
    directory: dir.path,
  );

  return isar;
}

