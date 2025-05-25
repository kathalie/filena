import '../../domain/entities/file_entity.dart';

abstract interface class FileRepository {
  Stream get fileChanges;

  Future<List<FileEntity>> getFilteredFiles(
    int? parentFolderId,
    bool onlyFavourites,
    bool includeFromSubfolders,
  );

  Future<List<FileEntity>> getFiles(List<int> fileIds);

  Future<void> createFile(String filePath, int? parentFolderId);

  Future<void> updateFile(String filePath);

  Future<void> deleteFile(int fileId);

  Future<void> removeFileFromFolder(int fileId, int folderId);

  Future<void> assignFileToFolder(int fileId, int folderId);
}
