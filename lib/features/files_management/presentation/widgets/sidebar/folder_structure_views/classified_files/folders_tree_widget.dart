import 'package:flutter/material.dart';
import 'package:tree_view_flutter/tree_view_flutter.dart';

import '../../../../../domain/structures/folder_tree.dart';
import '../../directory_widget/directory_widget.dart';
import 'folders_tree_vm.dart';

class FoldersTreeView extends StatelessWidget {
  static const rootFolderName = 'Filena';
  final _vm = FoldersTreeViewModel();

  FoldersTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FolderTreeStructure>(
      stream: _vm.folderStructure,
      builder: (context, snapshot) {
        final folderTree = snapshot.data;

        if (folderTree == null) {
          return TreeView(
            startExpanded: false,
            children: [
              _buildRootDirectoryWidget(false),
            ],
          );
        }

        return TreeView(
          startExpanded: false,
          children: _getFoldersTree(folderTree),
        );
      },
    );
  }

  List<Widget> _getFoldersTree(FolderTreeStructure childFolders) {
    return [
      TreeViewChild(
        parent: _buildRootDirectoryWidget(childFolders.isNotEmpty),
        children: _getChildList(childFolders),
      ),
    ];
  }

  List<Widget> _getChildList(FolderTreeStructure childFolders) {
    return childFolders.map((folderTree) {
      return Container(
        margin: const EdgeInsets.only(left: 8),
        child: TreeViewChild(
          parent: _buildDirectoryWidget(folderTree),
          children: _getChildList(folderTree.children),
        ),
      );
    }).toList();
  }

  Widget _buildDirectoryWidget(FolderTree folderTree) {
    return DirectoryWidget(
      name: folderTree.folder.name,
      hasNestedFolders: folderTree.children.isNotEmpty,
    );
  }

  Widget _buildRootDirectoryWidget(bool hasNestedFolders) {
    return DirectoryWidget(
      name: rootFolderName,
      hasNestedFolders: hasNestedFolders,
    );
  }
}
