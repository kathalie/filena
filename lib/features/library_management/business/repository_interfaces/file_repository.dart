import '../entities/file_entity.dart';

abstract interface class FileRepository {
  Future<FileEntity> getFile(String fileId);

  Future<List<FileEntity>> getFilesFromCollection(String collectionId);

  Future<void> createFile({
    required String name,
    required DateTime dateCreated,
    required String currentFileVersionId,
  });

  Future<void> updateFile({
    required String id,
    String? name,
    String? currentFileVersion,
  });

  Future<void> deleteFile(String fileId);
}
