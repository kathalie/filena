import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tree_view_flutter/tree_view_flutter.dart';

import '../../domain/types/folder_tree.dart';
import '../change_notifiers/folder_structure.dart';
import 'directory.dart';

class FoldersTreeView extends ConsumerWidget {
  const FoldersTreeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderTreeAsync = ref.watch(folderTreeProvider);

    return folderTreeAsync.when(
      data: (folderTree) {
        return TreeView(
          startExpanded: true,
          children: [
            TreeViewChild(
              parent: DirectoryWidget(
                folderEntity: folderTree.folder,
                hasNestedFolders: folderTree.children.isNotEmpty,
              ),
              children: _buildNestedFolders(folderTree.children),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text('Failed to load a folder tree'),
      ),
    );
  }

  List<Widget> _buildNestedFolders(List<FolderTree> folders) {
    return folders.map((folderTree) {
      return Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: TreeViewChild(
          parent: DirectoryWidget(
            folderEntity: folderTree.folder,
            hasNestedFolders: folderTree.children.isNotEmpty,
          ),
          children: folderTree.children.isNotEmpty
              ? _buildNestedFolders(folderTree.children)
              : [],
        ),
      );
    }).toList();
  }
}
