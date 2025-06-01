import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../domain/entities/folder_entity.dart';

class Breadcrumbs extends ConsumerWidget {
  final List<FolderEntity> _folderPath;
  final void Function(FolderEntity) _navigateFoFolder;

  const Breadcrumbs({
    required List<FolderEntity> folderPath,
    required void Function(FolderEntity) navigateFoFolder,
    super.key,
  })  : _folderPath = folderPath,
        _navigateFoFolder = navigateFoFolder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BreadCrumb.builder(
      itemCount: _folderPath.length,
      builder: (index) => _buildBreadCrumb(
        _folderPath[index],
        _navigateFoFolder,
      ),
      divider: const Icon(IconsConst.chevronRight),
    );
  }

  BreadCrumbItem _buildBreadCrumb(
    FolderEntity folder,
    void Function(FolderEntity) navigateFoFolder,
  ) {
    return BreadCrumbItem(
      content: PlatformTextButton(
        child: _BreadcrumbCaption(folder),
        onPressed: () => navigateFoFolder(folder),
      ),
    );
  }
}

class _BreadcrumbCaption extends StatelessWidget {
  final FolderEntity folder;

  const _BreadcrumbCaption(this.folder);

  @override
  Widget build(BuildContext context) {
    if (folder.isRoot) {
      return Row(
        children: [
          const Icon(IconsConst.rootFolder),
          const SizedBox(width: 8.0),
          Text(folder.name),
        ],
      );
    }

    return Text(folder.name);
  }
}
