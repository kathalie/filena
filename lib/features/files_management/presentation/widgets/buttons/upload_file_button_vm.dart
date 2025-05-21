import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:file_picker/file_picker.dart';

import '../../../business/repository_interfaces/file_repository.dart';

class UploadFileButtonViewModel {
  final _fileRepository = GetIt.I.get<FileRepository>();

  final _isLoading = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get isLoading => _isLoading.stream;

  final _error = PublishSubject<String>();
  Stream<String?> get error => _error.stream;

  Future<void> pickAndUploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      final paths = result.files.map((file) => file.path);

      _isLoading.add(true);

      try {
        for (final path in paths) {
          await _fileRepository.createFile(path!);
        }
      } catch (e) {
        _error.add('Upload failed: $e');
        _isLoading.add(false);
      }
    }
  }

  void dispose() {
    _isLoading.close();
    _error.close();
  }
}