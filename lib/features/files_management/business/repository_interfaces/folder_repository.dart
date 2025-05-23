import '../../domain/entities/folder_entity.dart';
import '../../domain/structures/folder_tree.dart';

abstract interface class FolderRepository {
  Stream get folderChanges;

  Future<FolderTreeStructure> get folderStructure;

  Future<List<FolderEntity>> getPathToFolder(int? folderId);

  Future<void> createFolder(int? parentFolderId, String name);

  Future<void> updateFolder(int folderId, String newName);

  Future<void> deleteFolder(int folderId);
}
