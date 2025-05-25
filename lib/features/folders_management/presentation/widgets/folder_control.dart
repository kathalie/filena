import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../../../../core/presentation/dialogs/confirmation_dialog.dart';
import '../../../../core/presentation/dialogs/text_field_dialog.dart';
import '../change_notifiers/folder_operations.dart';

typedef FolderControlOption = ({
  String caption,
  Icon icon,
  void Function() action
});

class FolderControl extends ConsumerWidget {
  const FolderControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () =>
              controller.isOpen ? controller.close() : controller.open(),
          icon: const Icon(IconsConst.moreInfo, size: 24.0),
          tooltip: 'Show folder actions',
        );
      },
      menuChildren: _buildFolderMenuOptions(context, ref),
    );
  }

  List<MenuItemButton> _buildFolderMenuOptions(
    BuildContext context,
    WidgetRef ref,
  ) {
    final List<
        ({
          String caption,
          FontAwesomeIconData icon,
          void Function() action,
        })> controlOptions = [
      (
        caption: 'New folder',
        icon: IconsConst.plus,
        action: () => _createFolder(context, ref),
      ),
      (
        caption: 'Rename folder',
        icon: IconsConst.edit,
        action: () => _renameFolder(context, ref),
      ),
      (
        caption: 'Remove folder',
        icon: IconsConst.delete,
        action: () => _removeFolder(context, ref),
      ),
    ];

    return controlOptions.map((option) {
      return MenuItemButton(
        onPressed: option.action,
        child: Row(
          children: [
            Icon(
              option.icon,
              size: 16.0,
              color: ThemeConsts.primaryColor,
            ),
            const SizedBox(width: 8.0),
            Text(option.caption),
          ],
        ),
      );
    }).toList();
  }

  Future<void> _createFolder(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final newFolderName = await showTextFieldDialog(
      context,
      'Create folder',
      'New folder name...',
    );

    if (newFolderName == null) return;

    final createFolder =
        ref.read(folderOperationsProvider.notifier).createFolder;

    await createFolder(newFolderName);
  }

  void _renameFolder(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final newFolderName = await showTextFieldDialog(
      context,
      'Rename folder',
      'New folder name...',
    );

    if (newFolderName == null) return;

    final renameSelectedFolder =
        ref.read(folderOperationsProvider.notifier).renameSelectedFolder;

    await renameSelectedFolder(newFolderName);
  }

  void _removeFolder(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final agreed = await showConfirmationDialog(
      context,
      'Delete folder',
      'Are you sure you want to delete this folder? Files assigned to this folder will remain in the system.',
    );

    if (agreed == null || !agreed) return;

    final deleteSelectedFolder =
        ref.read(folderOperationsProvider.notifier).deleteSelectedFolder;

    await deleteSelectedFolder();
  }
}
