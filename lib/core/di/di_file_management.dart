import 'package:get_it/get_it.dart';

import '../../features/files_management/business/repository_interfaces/file_repository.dart';
import '../../features/files_management/business/repository_interfaces/folder_repository.dart';
import '../../features/files_management/business/providers/state_provider.dart';
import '../../features/files_management/data/datasource/local/folder_datasource_local.dart';
import '../../features/files_management/data/datasource/file_datasource.dart';
import '../../features/files_management/data/datasource/local/file_datasource_local.dart';
import '../../features/files_management/data/datasource/folder_datasource.dart';
import '../../features/files_management/data/repositories/file_repository_impl.dart';
import '../../features/files_management/data/repositories/folder_repository_impl.dart';
import '../../features/files_management/data/storage/object_storage_manager.dart';
import '../../features/files_management/data/storage/storage_manager.dart';

Future<void> setupFileManagementDi() async {
  //Storage
  final objectStorageManager = await ObjectStorageManager.create();
  GetIt.I.registerSingleton<StorageManager>(objectStorageManager);

  // Data Sources
  GetIt.I.registerSingleton<FileDataSource>(FileDatasourceLocal());
  GetIt.I.registerSingleton<FolderDataSource>(FolderDatasourceLocal());

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

  // Providers
  GetIt.I.registerSingleton<StateProvider>(
    StateProvider(
      folderRepository: GetIt.I<FolderRepository>(),
      fileRepository: GetIt.I<FileRepository>(),
    ),
  );
}
