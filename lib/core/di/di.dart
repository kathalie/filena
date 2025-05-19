
import 'package:get_it/get_it.dart';

import '../db/objectbox.dart';
import 'di_file_management.dart';

Future<void> setupDI() async {
  GetIt.I.registerSingleton<ObjectBox>(await ObjectBox.create());

  await setupFileManagementDI();
}