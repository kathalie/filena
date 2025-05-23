import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../domain/enums/folder_structure_mode.dart';
import 'folder_structure_side_bar_vm.dart';
import 'folder_structure_views/classified_files/folders_tree/folders_tree_widget.dart';
import 'structure_mode_toggle/folder_structure_control_widget.dart';

class FolderStructureSideBar extends StatelessWidget {
  final _vm = FolderStructureSideBarPresenter();

  FolderStructureSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FolderStructureMode>(
      stream: _vm.currentFolderStructure,
      builder: (context, snapshot) {
        final mode = snapshot.data ?? FolderStructureMode.classified;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: FolderStructureControl(),
              ),
            ),
            _buildSideBarContent(mode),
          ],
        );
      },
    );
  }

  Widget _buildSideBarContent(FolderStructureMode mode) {
    return switch (mode) {
      FolderStructureMode.classified => _buildClassifiedView(),
      FolderStructureMode.unclassified => _buildUnclassifiedView(),
    };
  }

  Widget _buildClassifiedView() {
    return Expanded(child: FoldersTreeView());
  }

  //TODO unclassified view
  Widget _buildUnclassifiedView() {
    return const Placeholder();
  }
}
