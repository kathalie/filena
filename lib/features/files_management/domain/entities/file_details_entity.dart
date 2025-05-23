import '../../business/use_cases/get_file_category.dart';
import '../enums/file_category.dart';

class FileDetailsEntity {
  final String name;
  final int sizeInBytes;
  final DateTime timeCreated;
  final DateTime timeLastModified;
  final String mimeType;

  FileDetailsEntity({
    required this.name,
    required this.sizeInBytes,
    required this.timeCreated,
    required this.timeLastModified,
    required this.mimeType,
  });
}

extension FileDetailsEntityCategory on FileDetailsEntity {
  FileCategory get fileCategory => GetFileCategoryUseCase()(mimeType);
}
