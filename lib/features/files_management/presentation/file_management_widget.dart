import 'package:flutter/material.dart';

import '../../../core/presentation/const/theme_const.dart';
import 'file_management_vm.dart';
import 'widgets/main_view/topbar/breadcrumbs/breadcrumbs_widget.dart';
import 'widgets/main_view/topbar/folder_control/folder_control_widget.dart';
import 'widgets/sidebar/folder_structure_side_bar_widget.dart';

class FileManagementView extends StatelessWidget {
  final _vm = FileManagementViewModel();

  FileManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildSideView(),
        _buildMainView(),
      ],
    );
  }

  Widget _buildSideView() {
    return Container(
      width: 350,
      color: ThemeConsts.primaryBgColor,
      child: FolderStructureSideBar(),
    );
  }

  Widget _buildMainView() {
    return Expanded(
      child: Container(
        color: ThemeConsts.primaryBgColor,
        // child: FilesMainView(),
        child: _buildBreadcrumbsRow(),
      ),
    );
  }
  
  Widget _buildBreadcrumbsRow() {
    return Row(children: [
      BreadcrumbsView(),
      FolderControl(),
    ],);
  }
}
