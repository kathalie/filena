import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../../core/presentation/const/icons_const.dart';
import '../../../../../../../core/presentation/const/theme_const.dart';
import '../../../../../../../core/presentation/widgets/dialogs/text_field_dialog.dart';
import 'folder_control_vm.dart';

typedef FolderControlOption = ({
  String caption,
  Icon icon,
  void Function() action
});

class FolderControl extends StatelessWidget {
  final _vm = FolderControlViewModel();

  FolderControl({super.key});

  @override
  Widget build(BuildContext context) {
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
      menuChildren: _buildFolderMenuOptions(context),
    );
  }

  List<MenuItemButton> _buildFolderMenuOptions(BuildContext context) {
    final List<
        ({
          String caption,
          FontAwesomeIconData icon,
          void Function() action,
        })> controlOptions = [
      (
        caption: 'New folder',
        icon: IconsConst.plus,
        action: () => _createNewFolder(context),
      ),
      (
        caption: 'Rename folder',
        icon: IconsConst.edit,
        action: () => _removeFolder(context),
      ),
      (
        caption: 'Remove folder',
        icon: IconsConst.delete,
        action: () => _removeFolder(context),
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

  Future<void> _createNewFolder(BuildContext context) async {
    final newFolderName = await showTextFieldDialog(
      context,
      'Create folder',
      'New folder name...',
    );

    if (newFolderName == null) return;

    await _vm.createNewFolder(newFolderName);
  }

  void _renameFolder(BuildContext context) {} //TODO _renameFolder

  void _removeFolder(BuildContext context) {} //TODO _removeFolder
}
