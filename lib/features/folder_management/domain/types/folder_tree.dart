import 'package:collection/collection.dart';

import '../entities/folder_entity.dart';

class FolderTree {
  final FolderEntity folder;
  final List<FolderTree> children;

  FolderTree({
    required this.folder,
    required this.children,
  });

  static FolderTree fromList(List<FolderEntity> folders) {
    final foldersByParentId = groupBy<FolderEntity, int?>(
      folders,
      (folder) => folder.parentId,
    );

    final FolderEntity rootFolder =
        folders.where((folder) => folder.isRoot).first;


    return _buildTree(rootFolder, foldersByParentId);
  }

  static FolderTree _buildTree(
    FolderEntity folder,
    Map<int?, List<FolderEntity>> foldersByParentId,
  ) {
    final List<FolderTree> children = [];
    final childFolders = foldersByParentId[folder.id] ?? [];

    childFolders.sort((a, b) => a.name.compareTo(b.name));

    for (final childFolder in childFolders) {
      children.add(_buildTree(childFolder, foldersByParentId));
    }

    return FolderTree(
      folder: folder,
      children: children,
    );
  }
}
