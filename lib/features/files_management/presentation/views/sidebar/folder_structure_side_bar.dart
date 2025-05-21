import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'folder_structure_side_bar_vm.dart';
import 'folder_structure_views/classified_files/folders_tree_view.dart';

class FolderStructureSideBar extends StatelessWidget {
  final _vm = FolderStructureSideBarViewModel();

  FolderStructureSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FolderStructureType>(
      stream: _vm.folderStructureType,
      builder: (context, snapshot) {
        return switch (snapshot.data) {
          FolderStructureType.classified => FoldersTreeView(),
          //TODO unclassified view
          FolderStructureType.unclassified => const Placeholder(),
          _ => const Text('Something went wrong.'),
        };
      },
    );
  }
}
