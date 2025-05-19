import 'package:get_it/get_it.dart';

import '../../features/files_management/business/repository_interfaces/file_repository.dart';
import '../../features/files_management/business/usecases/add_file.dart';
import '../../features/files_management/data/datasource/file_datasource.dart';
import '../../features/files_management/data/datasource/file_datasource_local.dart';
import '../../features/files_management/data/repositories/file_repository_impl.dart';
import '../../features/files_management/data/storage/object_storage_manager.dart';
import '../../features/files_management/data/storage/storage_manager.dart';

Future<void> setupFileManagementDI() async {
  //Storage
  final objectStorageManager = await ObjectStorageManager.create();
  GetIt.I.registerSingleton<StorageManager>(objectStorageManager);

  // Data Sources
  GetIt.I.registerSingleton<FileDataSource>(FileDatasourceLocal());

  // Repositories
  GetIt.I.registerSingleton<FileRepository>(
    FileRepositoryImpl(
      fileDataSource: GetIt.I<FileDataSource>(),
      storageManager: GetIt.I<StorageManager>(),
    ),
  );

  //Use Cases
  GetIt.I.registerSingleton<AddFileUseCase>(
      AddFileUseCase(
          fileRepository: GetIt.I<FileRepository>(),
      ),
  );

}