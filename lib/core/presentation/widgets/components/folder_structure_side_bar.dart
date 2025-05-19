import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'folder_structure_side_bar_vm.dart';

class FolderStructureSideBar extends StatefulWidget {
  const FolderStructureSideBar({super.key});

  @override
  State<FolderStructureSideBar> createState() => _FolderStructureSideBarState();
}

class _FolderStructureSideBarState extends State<FolderStructureSideBar> {
  final _vm = FolderStructureSideBarViewModel();

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: [
    //     SegmentedButton(segments: segments, selected: selected)<int>(
    //       children: _buildChildren(),
    //       onValueChanged: _vm.onValueChanged,
    //     ),
    //   ],
    // );
    return Placeholder();
  }

  // _buildChildren() {
  //   return _vm.values.map(
  //     (key, value) => MapEntry(
  //       key,
  //       Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         child: Text(value),
  //       ),
  //     ),
  //   );
  // }
}
