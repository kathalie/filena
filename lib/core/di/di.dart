
import 'package:get_it/get_it.dart';

import '../db/objectbox.dart';
import 'di_embeddings.dart';
import 'di_file_management.dart';

Future<void> setupDI() async {
  final objectBox = await ObjectBox.create();
  GetIt.I.registerSingleton<ObjectBox>(objectBox);

  setupEmbeddingsDi();
  await setupFileManagementDi();
}
