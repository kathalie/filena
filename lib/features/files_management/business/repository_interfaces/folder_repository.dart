import '../../domain/structures/folder_tree.dart';

abstract interface class FolderRepository {
  Stream<FolderTreeStructure> get folderStructureStream;

  Future<void> createFolder(int? parentFolderId, String name);

  Future<void> updateFolder(int folderId, String newName);

  Future<void> deleteFolder(int folderId);
}
