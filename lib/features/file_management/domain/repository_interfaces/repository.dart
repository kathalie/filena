import '../../common/helpers/file_category.dart';
import '../../domain/entities/file_entity.dart';

abstract interface class FileRepository {
  Stream get fileChanges;

  Stream get fileInFolderChanges;

  Future<List<FileEntity>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  );

  Future<List<FileEntity>> getUnclassifiedFiles(
    FileCategory? category,
    bool onlyPrioritized,
  );

  Future<List<FileEntity>> getFiles(List<int> fileIds);

  Future<void> createFile(String filePath, int parentFolderId);

  Future<void> togglePrioritized(int fileId);

  Future<void> renameFile(int fileId, String newName);

  Future<void> deleteFile(int fileId);

  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId);

  Future<void> assignFileToFolder(int fileId, int folderId);

  Future<List<int>> getParentFolderIds(int fileId);
}
