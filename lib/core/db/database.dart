import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../features/library_management/data/models/category_model.dart';
import '../../../../features/library_management/data/models/collection_model.dart';
import '../../../../features/library_management/data/models/file_model.dart';
import '../../../../features/library_management/data/models/tag_model.dart';
import '../../../../features/synchronization/data/models/device_model.dart';
import '../../../../features/version_control/data/models/file_version_model.dart';
import '../../features/user/data/models/user_model.dart';
import '../constants/constants.dart';

Future<Isar> isarDbConnection() async {
  const isarInstanceName = 'filena';
  final dir = await getApplicationDocumentsDirectory();

  final instance = Isar.getInstance(isarInstanceName);

  if (instance != null) {
    return instance;
  }

  final isar = await Isar.open(
    [
      UserSchema,
      CategorySchema,
      FileCollectionSchema,
      FileSchema,
      TagSchema,
      DeviceSchema,
      FileVersionSchema,
    ],
    inspector: true,
    directory: dir.path,
    name: isarInstanceName,
  );

  for (final defaultCategory in DefaultCategories.values) {
    if ((await isar.categorys
                .filter()
                .nameEqualTo(defaultCategory.title)
                .findAll())
            .isNotEmpty &&
        (await isar.fileCollections
                .filter()
                .nameEqualTo(defaultCategory.title)
                .findAll())
            .isNotEmpty) {
      continue;
    }


    final rootCollection = FileCollection()..name = defaultCategory.title;

    final category = Category()
      ..name = defaultCategory.title
      ..extensions = defaultCategory.extensions
      ..rootCollection.value = rootCollection;

    isar.writeTxnSync(() {
      isar.fileCollections.putSync(rootCollection);
      isar.categorys.putSync(category);
      // await isar.categorys.put(category);
      // await isar.fileCollections.put(rootCollection);
      // await category.rootCollection.save();
    });
  }

  return isar;
}
