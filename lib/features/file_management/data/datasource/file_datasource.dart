import 'dao/create_file_dao.dart';
import 'dao/file_dao.dart';

abstract interface class FileDataSource {
  // Future<List<File>> getFilesFromCollection(String collectionId);

  Future<FileDao> getFile(int fileId);

  Future<int> createFile(CreateFileDao createFileDao);

  // Future<File> updateFile({
  //   required String id,
  //   String? name,
  //   String? currentFileVersion,
  // });
  //
  // Future<void> deleteFile(String fileId);
}
