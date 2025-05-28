import '../../domain/entities/processed_file_content_entity.dart';
import '../dto/processed_file_content_dto.dart';

extension ProcessedFileContentToEntity on ProcessedFileContentDto {
  ProcessedFileContentEntity toEntity() {
    return ProcessedFileContentEntity(
      // keywords: keywords,
      summary: summary,
    );
  }
}
