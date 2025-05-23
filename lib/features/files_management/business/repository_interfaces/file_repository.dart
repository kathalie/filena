import '../../domain/entities/file_entity.dart';

abstract interface class FileRepository {
  Stream<List<FileEntity>> get filteredFiles;

  void setParentFolderFilter(int? parentFolderId);

  void setOnlyFavouritesFilter(bool onlyFavourites);

  void setIncludeSubfoldersFilter(bool includeFromSubfolders);

  Future<void> createFile(String filePath);

  Future<void> updateFile(String filePath);

  Future<void> deleteFile(int fileId);

  Future<void> removeFileFromFolder(int fileId, int folderId);
}
