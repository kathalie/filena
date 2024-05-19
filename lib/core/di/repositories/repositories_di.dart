import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/library_management/business/repository_interfaces/category_repository.dart';
import '../../../features/library_management/business/repository_interfaces/collection_repository.dart';
import '../../../features/library_management/business/repository_interfaces/file_repository.dart';
import '../../../features/library_management/business/repository_interfaces/tag_repository.dart';
import '../../../features/library_management/data/repositories/category_repository_impl.dart';
import '../../../features/library_management/data/repositories/collection_repository_impl.dart';
import '../../../features/library_management/data/repositories/file_repository_impl.dart';
import '../../../features/library_management/data/repositories/tag_repository_impl.dart';
import '../../../features/synchronization/business/repository_interfaces/device_repository.dart';
import '../../../features/synchronization/data/repositories/device_repository_impl.dart';
import '../../../features/user/business/repository_interfaces/user_repository.dart';
import '../../../features/user/data/repositories/user_repository_impl.dart';
import '../../../features/version_control/business/repository_interfaces/file_version_repository.dart';
import '../../../features/version_control/data/repositories/file_version_repository_impl.dart';
import '../data_sources/data_sources_di.dart';

part 'repositories_di.g.dart';

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepositoryImpl(
    categoryDataSource: ref.watch(categoryDaoProvider),
  );
}

@riverpod
CollectionRepository collectionRepository(CollectionRepositoryRef ref) {
  return CollectionRepositoryImpl(
    collectionDataSource: ref.watch(collectionDaoProvider),
  );
}

@riverpod
FileRepository fileRepository(FileRepositoryRef ref) {
  return FileRepositoryImpl(
    fileDataSource: ref.watch(fileDaoProvider),
    fileVersionRepository: ref.watch(fileVersionRepositoryProvider),
  );
}

@riverpod
TagRepository tagRepository(TagRepositoryRef ref) {
  return TagRepositoryImpl(
    tagDataSource: ref.watch(tagDaoProvider),
  );
}

@riverpod
FileVersionRepository fileVersionRepository(FileVersionRepositoryRef ref) {
  return FileVersionRepositoryImpl(
    fileVersionDataSource: ref.watch(fileVersionDaoProvider),
  );
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
    userDataSource: ref.watch(userDaoProvider),
  );
}

@riverpod
DeviceRepository deviceRepository(DeviceRepositoryRef ref) {
  return DeviceRepositoryImpl(
    deviceDataSource: ref.watch(deviceDaoProvider),
  );
}
