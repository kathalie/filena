import '../../domain/entities/processed_file_content_entity.dart';
import '../../domain/repository_interfaces/repository.dart';
import '../datasource_interfaces/client.dart';
import '../translators/to_entity.dart';

class FileContentProcessingRepositoryImpl
    implements FileContentProcessingRepository {
  final FileContentProcessingClient _client;

  FileContentProcessingRepositoryImpl(this._client);

  @override
  Future<ProcessedFileContentEntity> processImageFileContent(
    String base64,
  ) async {
    final resultDto = await _client.processImageFileContent(base64);

    return resultDto.toEntity();
  }

  @override
  Future<ProcessedFileContentEntity> processTextFileContent(
    String content,
  ) async {
    final resultDto = await _client.processTextFileContent(content);

    return resultDto.toEntity();
  }
}
