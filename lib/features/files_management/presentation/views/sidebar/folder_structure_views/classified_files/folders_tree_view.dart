import 'package:flutter/material.dart';
import 'package:tree_view_flutter/tree_view_flutter.dart';

import '../../../../../domain/structures/folder_tree.dart';
import 'folders_tree_vm.dart';

class FoldersTreeView extends StatelessWidget {
  final _vm = FoldersTreeViewModel();

  FoldersTreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FolderTreeStructure>(
      stream: _vm.folderStructure,
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data == null) {
          return const CircularProgressIndicator(); // TODO is it really a progress?
        }

        return TreeView(
          startExpanded: false,
          children: _getChildList(data),
        );
      },
    );
  }

  List<Widget> _getChildList(FolderTreeStructure childFolders) {
    return childFolders.map((folder) {
      return Container(
        margin: const EdgeInsets.only(left: 8),
        child: TreeViewChild(
          parent: _getDirectoryWidget(folder),
          children: _getChildList(folder.children),
        ),
      );
    }).toList();
  }

  Widget _getDirectoryWidget(FolderTree folderTree) =>
      Text(folderTree.folder.name); //TODO Directory widget
}
