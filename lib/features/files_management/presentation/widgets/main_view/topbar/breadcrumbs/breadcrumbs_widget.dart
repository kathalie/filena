import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../../../core/presentation/const/icons_const.dart';
import '../../../../../domain/entities/folder_entity.dart';
import 'breadcrumbs_vm.dart';

class BreadcrumbsView extends StatelessWidget {
  final _vm = BreadcrumbsPresenter();

  BreadcrumbsView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FolderEntity>>(
      stream: _vm.folderPath,
      builder: (context, snapshot) {
        final folderPath = snapshot.data ?? [];

        final breadcrumbsPath = [null, ...folderPath];

        return BreadCrumb.builder(
          itemCount: breadcrumbsPath.length,
          builder: (index) => _buildBreadCrumb(breadcrumbsPath[index]),
          divider: const Icon(IconsConst.chevronRight),
        );
      },
    );
  }

  BreadCrumbItem _buildBreadCrumb(FolderEntity? folder) {
    return BreadCrumbItem(
      content: PlatformTextButton(
        child: _buildBreadcrumbCaption(folder),
        onPressed: () => _vm.navigateToFolder(folder),
      ),
    );
  }

  Widget _buildBreadcrumbCaption(FolderEntity? folder) {
    return folder == null
        ? const Icon(IconsConst.rootFolder)
        : Text(folder.name);
  }
}
