import 'dto/file_content_info_dto.dart';
import 'dto/generate_file_content_dto.dart';

abstract interface class FileInfoDetailsDatasource {
  Future<FileContentInfoDto> retrieveFileContentInfo(
    FileContentInfoPromptDto promptDto,
  );
}
