import '../dto/processed_file_content_dto.dart';

abstract interface class FileContentProcessingClient {
  Future<ProcessedFileContentDto> processTextFileContent(String content);

  Future<ProcessedFileContentDto> processImageFileContent(String base64);
}
