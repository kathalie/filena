import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/library_management/data/dao/category_dao.dart';
import '../../../features/library_management/data/dao/collection_dao.dart';
import '../../../features/library_management/data/dao/file_dao.dart';
import '../../../features/library_management/data/dao/tag_dao.dart';
import '../../../features/library_management/data/data_source_interfaces/category_data_source.dart';
import '../../../features/library_management/data/data_source_interfaces/collection_data_source.dart';
import '../../../features/library_management/data/data_source_interfaces/file_data_source.dart';
import '../../../features/library_management/data/data_source_interfaces/tag_data_source.dart';
import '../../../features/synchronization/data/dao/device_dao.dart';
import '../../../features/synchronization/data/data_source_interfaces/device_data_source.dart';
import '../../../features/version_control/data/dao/file_version_dao.dart';
import '../../../features/version_control/data/data_source_interfaces/file_version_data_source.dart';
import '../../common/data/dao/user_dao.dart';
import '../../common/data/data_source_interfaces/user_data_source.dart';

part 'data_sources_di.g.dart';

@riverpod
UserDataSource userDao(UserDaoRef ref) {
  return UserDao();
}

@riverpod
TagDataSource tagDao(TagDaoRef ref) {
  return TagDao();
}

@riverpod
CategoryDataSource categoryDao(CategoryDaoRef ref) {
  return CategoryDao();
}

@riverpod
CollectionDataSource collectionDao(CollectionDaoRef ref) {
  return CollectionDao();
}

@riverpod
FileDataSource fileDao(FileDaoRef ref) {
  return FileDao();
}

@riverpod
DeviceDataSource deviceDao(DeviceDaoRef ref) {
  return DeviceDao();
}

@riverpod
FileVersionDataSource fileVersionDao(FileVersionDaoRef ref) {
  return FileVersionDao();
}