import '../entities/folder_entity.dart';
import '../types/folder_tree.dart';

abstract interface class FolderRepository {
  Stream get folderChanges;

  Future<FolderTree> get folderStructure;

  Future<FolderEntity> get rootFolder;

  Future<FolderEntity?> getFolder(int id);

  Future<List<FolderEntity>> getPathToFolder(int? folderId);

  Future<void> createFolder(int? parentFolderId, String name);

  Future<void> updateFolder(int folderId, String newName);

  Future<void> deleteFolder(int folderId);
}
