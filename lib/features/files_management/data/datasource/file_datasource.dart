import 'dto/file_create_dto.dart';
import 'dto/file_dto.dart';

abstract interface class FileDataSource {
  Future<FileDto?> getFile(int id);

  Future<int> createFile(FileCreateDto createFileDao);

  // Future<void> updateFile(UpdateFileDto updateFileDto);

  Future<void> deleteFile(int id);
}
