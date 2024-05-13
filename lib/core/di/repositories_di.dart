import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/library_management/business/repository_interfaces/category_repository.dart';
import '../../features/library_management/business/repository_interfaces/collection_repository.dart';
import '../../features/library_management/business/repository_interfaces/file_repository.dart';
import '../../features/library_management/business/repository_interfaces/tag_repository.dart';
import '../../features/library_management/data/repositories/category_repository_impl.dart';
import '../../features/library_management/data/repositories/collection_repository_impl.dart';
import '../../features/library_management/data/repositories/file_repository_impl.dart';
import '../../features/library_management/data/repositories/tag_repository_impl.dart';
import '../../features/synchronization/business/repository_interfaces/device_repository.dart';
import '../../features/synchronization/data/repositories/device_repository_impl.dart';
import '../../features/version_control/business/repository_interfaces/file_version_repository.dart';
import '../../features/version_control/data/repositories/file_version_repository_impl.dart';
import '../common/business/repository_interfaces/user_repository.dart';
import '../common/data/repositories/user_repository_impl.dart';

final categoryRepoProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepositoryImpl();
});

final collectionRepoProvider = Provider<CollectionRepository>((ref) {
  return CollectionRepositoryImpl();
});

final fileRepoProvider = Provider<FileRepository>((ref) {
  return FileRepositoryImpl();
});

final tagRepoProvider = Provider<TagRepository>((ref) {
  return TagRepositoryImpl();
});

final fileVersionRepoProvider = Provider<FileVersionRepository>((ref) {
  return FileVersionRepositoryImpl();
});

final userRepoProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl();
});

final deviceRepoProvider = Provider<DeviceRepository>((ref) {
  return DeviceRepositoryImpl();
});
