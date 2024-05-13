import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../features/library_management/data/models/category_model.dart';
import '../../../../features/library_management/data/models/collection_model.dart';
import '../../../../features/library_management/data/models/file_model.dart';
import '../../../../features/library_management/data/models/tag_model.dart';
import '../../../../features/synchronization/data/models/device_model.dart';
import '../../../../features/version_control/data/models/file_version_model.dart';
import '../models/user_model.dart';

Future<Isar> isarDbConnection() async {
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [
      UserSchema,
      CategorySchema,
      FilesCollectionSchema,
      FileSchema,
      TagSchema,
      DeviceSchema,
      FileVersionSchema,
    ],
    inspector: true,
    directory: dir.path,
  );

  return isar;
}
