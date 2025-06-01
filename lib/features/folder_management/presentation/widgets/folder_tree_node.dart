import 'package:flutter/material.dart';
import 'package:tree_view_flutter/tree_view_flutter.dart';

import '../../domain/entities/folder_entity.dart';
import 'directory.dart';

class FolderTreeNode extends StatefulWidget {
  final FolderEntity folderEntity;
  final bool hasNestedFolders;
  final List<Widget> children;

  const FolderTreeNode({
    required this.folderEntity,
    required this.hasNestedFolders,
    required this.children,
    super.key,
  });

  @override
  State<FolderTreeNode> createState() => _FolderTreeNodeState();
}

class _FolderTreeNodeState extends State<FolderTreeNode> {
  final GlobalKey<TreeViewChildState> treeViewKey = GlobalKey<TreeViewChildState>();
  bool isExpanded = true;

  void toggleExpansion() {
    final treeViewCurrentState = treeViewKey.currentState;

    if (treeViewCurrentState == null) return;

    setState(() {
      treeViewCurrentState.toggleExpanded();
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TreeViewChild(
      key: treeViewKey,
      onTap: () {},
      startExpanded: true,
      parent: DirectoryWidget(
        folderEntity: widget.folderEntity,
        hasNestedFolders: widget.hasNestedFolders,
        isExpanded: isExpanded,
        toggleExpansion: toggleExpansion,
      ),
      children: widget.children,
    );
  }
}
