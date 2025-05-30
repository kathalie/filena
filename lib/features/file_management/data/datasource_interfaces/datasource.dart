import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';

abstract interface class FileDataSource {
  Stream get fileChanges;

  Future<Set<FileDto>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  );

  Future<List<FileDto>> getFiles(List<int> fileIds);

  Future<int> createFile(FileCreateDto createFileDto, int parentFolderId);

  Future<void> createFiles(List<FileCreateDto> createFileDtos);

  Future<void> togglePrioritized(int fileId);

  Future<void> renameFile(int fileId, String newName);

  Future<void> removeFilesFromFolder(List<int> fileIds, int folderId);

  Future<void> assignFileToFolder(int fileId, int folderId);

  Future<void> deleteFile(int fileId);
}
