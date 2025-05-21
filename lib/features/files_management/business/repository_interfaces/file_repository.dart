import '../../domain/entities/file_entity.dart';

abstract interface class FileRepository {
  Future<FileEntity> getFileDetails(int fileId);

  Future<void> createFile(String filePath);

  Future<void> updateFile(String filePath);

  Future<void> deleteFile(int fileId);

  Future<void> removeFileFromFolder(int fileId, int folderId);

  Future<List<FileEntity>> getFilesInFolder(int folderId);
}
