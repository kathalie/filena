import 'package:flutter/material.dart';

import '../../../core/presentation/const/theme_const.dart';
import 'file_management_vm.dart';
import 'views/sidebar/folder_structure_side_bar_widget.dart';

class FileManagementView extends StatelessWidget {
  final _vm = FileManagementViewModel();

  FileManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 350,
          color: ThemeConsts.primaryBgColor,
          child: FolderStructureSideBar(),
        ),
        Expanded(
          child: Container(
            color: ThemeConsts.primaryBgColor,
            child: Placeholder(), // TODO Main content
          ),
        ),
      ],
    );
  }
}
