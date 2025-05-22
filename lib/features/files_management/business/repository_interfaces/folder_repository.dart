import '../../domain/entities/folder_entity.dart';
import '../../domain/structures/folder_tree.dart';

abstract interface class FolderRepository {
  Stream<FolderTreeStructure> get folderStructure;

  Stream<FolderEntity?> get selectedFolder;

  void selectFolder(FolderEntity? newFolder);

  Stream<List<FolderEntity>> get pathToSelectedFolder;

  Future<void> createFolder(int? parentFolderId, String name);

  Future<void> updateFolder(int folderId, String newName);

  Future<void> deleteFolder(int folderId);
}
