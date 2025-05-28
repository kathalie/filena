import '../entities/processed_file_content_entity.dart';

abstract interface class FileContentProcessingRepository {
  Future<ProcessedFileContentEntity> processTextFileContent(String content);

  Future<ProcessedFileContentEntity> processImageFileContent(String base64);
}
