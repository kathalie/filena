import '../../domain/entities/file_entity.dart';

abstract interface class FileRepository {
  Stream get fileChanges;

  Future<List<FileEntity>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  );

  Future<List<FileEntity>> getFiles(List<String> fileIds);

  Future<void> createFile(String filePath, int parentFolderId);

  Future<void> updateFile(String filePath);

  Future<void> deleteFile(String fileId);

  Future<void> removeFilesFromFolder(List<String> fileIds, int folderId);

  Future<void> assignFileToFolder(String fileId, int folderId);
}
