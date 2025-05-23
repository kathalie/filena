import 'dto/file_create_dto.dart';
import 'dto/file_dto.dart';

abstract interface class FileDataSource {
  Stream<List<FileDto>> get filteredFiles;

  void setParentFolderFilter(int? parentFolderId);

  void setOnlyFavouritesFilter(bool onlyFavourites);

  void setIncludeSubfoldersFilter(bool includeFromSubfolders);

  Future<int> createFile(FileCreateDto createFileDto);

  Future<void> createFiles(List<FileCreateDto> createFileDtos);

  // Future<void> updateFile(UpdateFileDto updateFileDto);

  Future<void> assignFileToFolder(int fileId, int folderId);

  Future<void> deleteFile(int id);
}
