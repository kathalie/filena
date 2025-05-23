import 'package:flutter/material.dart';
import 'package:tree_view_flutter/tree_view_flutter.dart';

import '../../../../../../domain/structures/folder_tree.dart';
import '../../../directory_widget/directory_widget.dart';
import 'folders_tree_vm.dart';

class FoldersTreeView extends StatelessWidget {
  final _vm = FoldersTreePresenter();

  FoldersTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FolderTreeStructure>(
      stream: _vm.folderStructure,
      builder: (context, snapshot) {
        final folderTree = snapshot.data ?? [];

        return TreeView(
          startExpanded: true,
          children: [
            TreeViewChild(
              parent: DirectoryWidget(
                folderEntity: null,
                hasNestedFolders: folderTree.isNotEmpty,
              ),
              children: _buildNestedFolders(folderTree),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildNestedFolders(FolderTreeStructure folders) {
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
