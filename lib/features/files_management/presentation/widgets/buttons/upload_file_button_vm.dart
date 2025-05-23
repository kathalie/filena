import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../business/providers/state_provider.dart';
import '../../../business/repository_interfaces/file_repository.dart';
import '../../../domain/entities/folder_entity.dart';

class UploadFileButtonPresenter {
  final _fileRepository = GetIt.I.get<FileRepository>();
  final _stateProvider = GetIt.I.get<StateProvider>();

  Stream<FolderEntity?> get selectedFolder => _stateProvider.selectedFolder;

  final isLoading = BehaviorSubject<bool>.seeded(false);
  final error = PublishSubject<String>();

  Future<void> createFile(String path, FolderEntity? parentFolder) async {
    await _fileRepository.createFile(path, parentFolder?.id);
  }

  void dispose() {
    isLoading.close();
    error.close();
  }
}