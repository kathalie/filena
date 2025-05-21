import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../../core/presentation/const/icons_const.dart';
import '../../../../../domain/entities/folder_entity.dart';
import '../../../../../domain/structures/folder_tree.dart';
import 'breadcrumbs_vm.dart';

class BreadcrumbsView extends StatelessWidget {
  final BreadcrumbsViewModel _vm;

  BreadcrumbsView({
    required BehaviorSubject<FolderEntity> currentFolder,
    required BehaviorSubject<FolderTree> folderTree,
    super.key,
  }) : _vm = BreadcrumbsViewModel(currentFolder, folderTree);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<FolderEntity>>(
      stream: _vm.folderPath,
      builder: (context, snapshot) {
        final folderPath = snapshot.data ?? [];

        return BreadCrumb.builder(
          itemCount: folderPath.length,
          builder: (index) => _buildBreadCrumb(folderPath[index]),
          divider: const Icon(IconsConst.chevronRight),
        );
      },
    );
  }

  BreadCrumbItem _buildBreadCrumb(FolderEntity folder) {
    return BreadCrumbItem(
      content: PlatformTextButton(
        child: Text(folder.name),
        onPressed: () => _vm.navigateToFolder(folder),
      ),
    );
  }
}
