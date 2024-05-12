import '../entities/file_entity.dart';

abstract interface class FileRepository {
  Future<FileEntity> getFile(String fileId);

  Future<List<FileEntity>> getFilesFromCollection(String collectionId);

  Future<void> createFile(FileEntity newFile);

  Future<FileEntity> updateFile(FileEntity updatedFile);

  Future<void> deleteFile(String fileId);
}
