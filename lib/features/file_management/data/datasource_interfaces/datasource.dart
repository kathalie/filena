import '../../common/helpers/file_category.dart';
import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';

abstract interface class FileDataSource {
  Future<List<String>> get allFileKeys;

  Stream get fileChanges;

  Stream get fileInFolderChanges;

  Future<Set<FileDto>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  );

  Future<List<FileDto>> getUnclassifiedFiles(
    FileCategory? category,
    bool onlyPrioritized,
  );

  Future<List<FileDto>> getFiles(List<int> fileIds);

  Future<int> createFile(FileCreateDto createFileDto, int parentFolderId);

  Future<void> togglePrioritized(int fileId);

  Future<void> renameFile(int fileId, String newName);

  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId);

  Future<void> removeFile(String fileKey);

  Future<void> assignFileToFolder(int fileId, int folderId);

  Future<void> deleteFile(int fileId);

  Future<List<int>> getParentFolderIds(int folderId);
}
