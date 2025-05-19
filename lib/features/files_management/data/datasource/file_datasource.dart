import 'dto/create_file_dto.dart';
import 'dto/file_dto.dart';

abstract interface class FileDataSource {
  // Future<List<File>> getFilesFromCollection(String collectionId);

  Future<FileDto> getFile(int fileId);

  Future<int> createFile(CreateFileDto createFileDao);

  // Future<File> updateFile({
  //   required String id,
  //   String? name,
  //   String? currentFileVersion,
  // });
  //
  // Future<void> deleteFile(String fileId);
}
