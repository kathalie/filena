import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../domain/entities/folder_entity.dart';
import '../change_notifiers/folder_path.dart';
import '../change_notifiers/selected_folder.dart';

class Breadcrumbs extends ConsumerWidget {
  const Breadcrumbs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderPathAsync = ref.watch(folderPathProvider);

    return folderPathAsync.when(
      data: (folderPath) {
        final navigateFoFolder =
            ref.read(selectedFolderProvider.notifier).select;

        return BreadCrumb.builder(
          itemCount: folderPath.length,
          builder: (index) => _buildBreadCrumb(
            folderPath[index],
            navigateFoFolder,
          ),
          divider: const Icon(IconsConst.chevronRight),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text('Failed to load breadcrumbs'),
      ),
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
