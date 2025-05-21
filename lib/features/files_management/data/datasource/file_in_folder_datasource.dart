import 'dto/file_dto.dart';

abstract interface class FileInFolderDatasource {
  Future<List<FileDto>> getFilesFromFolder(int folderId);

  Future<void> assignFileToFolder(int fileId, int folderId);
}