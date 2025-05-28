import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';

abstract interface class FileDataSource {
  Stream get fileChanges;

  Future<Set<FileDto>> getFilteredFiles(
    int parentFolderId,
    bool onlyPrioritized,
    bool includeFromSubfolders,
  );

  Future<List<FileDto>> getFiles(List<String> fileIds);

  Future<int> createFile(FileCreateDto createFileDto, int parentFolderId);

  Future<void> createFiles(List<FileCreateDto> createFileDtos);

  // Future<void> updateFile(UpdateFileDto updateFileDto);

  Future<void> removeFilesFromFolder(List<String> fileIds, int folderId);

  Future<void> assignFileToFolder(String fileId, int folderId);

  Future<void> deleteFile(String id);
}
