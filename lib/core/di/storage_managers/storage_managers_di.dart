import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/library_management/business/entities/supplementary_structures/file_location.dart';
import '../../../features/version_control/data/interfaces/storage_manager.dart';
import '../../../features/version_control/data/storage_managers/object_storage_manager.dart';

part 'storage_managers_di.g.dart';

@riverpod
Future<StorageManager<ObjectLocation>> objectStorageManager(
  ObjectStorageManagerRef ref,
) async {
  return await ObjectStorageManager.create();
}
