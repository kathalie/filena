import '../../domain/entities/file_entity.dart';

abstract interface class FileRepository {
  Stream get fileChanges;

  Future<List<FileEntity>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  );

  Future<List<FileEntity>> getFiles(List<int> fileIds);

  Future<void> createFile(String filePath, int parentFolderId);

  Future<void> updateFile(String filePath);

  Future<void> togglePrioritized(int fileId);

  Future<void> renameFile(int fileId, String newName);

  Future<void> deleteFile(int fileId);

  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId);

  Future<void> assignFileToFolder(int fileId, int folderId);
}
