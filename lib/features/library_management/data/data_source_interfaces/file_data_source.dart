import '../models/file_model.dart';

abstract interface class FileDataSource {
  Future<List<File>> getFilesFromCollection(String collectionId);

  Future<File> getFile(String fileId);

  Future<void> createFile({
    required String name,
    required DateTime dateCreated,
    required String currentFileVersionId,
  });

  Future<File> updateFile({
    required String id,
    String? name,
    String? currentFileVersion,
  });

  Future<void> deleteFile(String fileId);
}
