import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '../../../business/repository_interfaces/file_repository.dart';

class UploadFileButtonPresenter {
  final _fileRepository = GetIt.I.get<FileRepository>();

  final isLoading = BehaviorSubject<bool>.seeded(false);
  final error = PublishSubject<String>();

  Future<void> createFile(String path) async {
    await _fileRepository.createFile(path);
  }

  void dispose() {
    isLoading.close();
    error.close();
  }
}