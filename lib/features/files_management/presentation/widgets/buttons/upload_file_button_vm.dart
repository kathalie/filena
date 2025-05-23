import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../business/repository_interfaces/file_repository.dart';
import '../../../business/repository_interfaces/folder_repository.dart';
import '../../../domain/entities/folder_entity.dart';

class UploadFileButtonPresenter {
  final _fileRepository = GetIt.I.get<FileRepository>();
  final _folderRepository = GetIt.I.get<FolderRepository>();

  Stream<FolderEntity?> get selectedFolder => _folderRepository.selectedFolder;

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