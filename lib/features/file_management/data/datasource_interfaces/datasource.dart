import '../dto/file_create_dto.dart';
import '../dto/file_dto.dart';

abstract interface class FileDataSource {
  Stream get fileChanges;

  Future<Set<FileDto>> getFilteredFiles(
    int parentFolderId,
    bool onlyFavourites,
    bool includeFromSubfolders,
  );

  Future<List<FileDto>> getFiles(List<int> fileIds);

  Future<int> createFile(FileCreateDto createFileDto, int parentFolderId);

  Future<void> createFiles(List<FileCreateDto> createFileDtos);

  // Future<void> updateFile(UpdateFileDto updateFileDto);

  Future<void> assignFileToFolder(int fileId, int folderId);

  Future<void> deleteFile(int id);
}
