import '../dto/folder_create_dto.dart';
import '../dto/folder_dto.dart';
import '../dto/folder_update_dto.dart';

abstract interface class FolderDataSource {
  Stream get folderChanges;

  Future<List<FolderDto>> get allFolders;

  Future<FolderDto> get rootFolder;

  Future<List<FolderDto>> getPathTo(int? folderId);

  Future<FolderDto?> getFolder(int id);

  Future<int> createFolder(FolderCreateDto createFolderDto);

  Future<void> deleteFolder(int folderId);

  Future<void> updateFolder(FolderUpdateDto folderUpdateDto);
}
