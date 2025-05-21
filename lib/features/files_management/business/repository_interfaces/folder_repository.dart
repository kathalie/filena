import '../../domain/enums/folder_structure_mode.dart';
import '../../domain/structures/folder_tree.dart';

abstract interface class FolderRepository {
  Stream<FolderTreeStructure> get folderStructure;

  Future<void> createFolder(int? parentFolderId, String name);

  Future<void> updateFolder(int folderId, String newName);

  Future<void> deleteFolder(int folderId);
}
