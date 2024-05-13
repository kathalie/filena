import '../../business/entities/file_entity.dart';

abstract interface class FileDataSource {
  Future<List<FileEntity>> getFilesFromCollection(String collectionId);

  Future<FileEntity> getFile(String fileId);

  Future<void> createFile(FileEntity newFile);

  Future<FileEntity> updateFile(FileEntity updatedFile);

  Future<void> deleteFile(String fileId);
}