import 'package:get_it/get_it.dart';

import '../../features/files_management/business/repository_interfaces/file_repository.dart';
import '../../features/files_management/business/repository_interfaces/folder_repository.dart';
import '../../features/files_management/business/repository_interfaces/user_choice_repository.dart';
import '../../features/files_management/data/datasource/file_in_folder_datasource.dart';
import '../../features/files_management/data/datasource/local/file_in_folder_datasource_local.dart';
import '../../features/files_management/data/datasource/local/folder_datasource_local.dart';
import '../../features/files_management/data/datasource/file_datasource.dart';
import '../../features/files_management/data/datasource/local/file_datasource_local.dart';
import '../../features/files_management/data/datasource/folder_datasource.dart';
import '../../features/files_management/data/repositories/file_repository_impl.dart';
import '../../features/files_management/data/repositories/folder_repository_impl.dart';
import '../../features/files_management/data/repositories/user_choice_repository_impl.dart';
import '../../features/files_management/data/storage/object_storage_manager.dart';
import '../../features/files_management/data/storage/storage_manager.dart';

Future<void> setupFileManagementDI() async {
  //Storage
  final objectStorageManager = await ObjectStorageManager.create();
  GetIt.I.registerSingleton<StorageManager>(objectStorageManager);

  // Data Sources
  GetIt.I.registerSingleton<FileDataSource>(FileDatasourceLocal());
  GetIt.I.registerSingleton<FolderDataSource>(FolderDatasourceLocal());
  GetIt.I
      .registerSingleton<FileInFolderDatasource>(FileInFolderDatasourceLocal());

  // Repositories
  GetIt.I.registerSingleton<FileRepository>(
    FileRepositoryImpl(
      fileDataSource: GetIt.I<FileDataSource>(),
      storageManager: GetIt.I<StorageManager>(),
    ),
  );
  GetIt.I.registerSingleton<FolderRepository>(
    FolderRepositoryImpl(GetIt.I<FolderDataSource>()),
  );
  GetIt.I.registerSingleton<UserChoiceRepository>(
    UserChoiceRepositoryImpl(),
  );
}
