import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../core/presentation/const/icons_const.dart';
import '../../../../domain/entities/folder_entity.dart';
import 'folder_control_vm.dart';

typedef FolderControlOption = ({
  String caption,
  Icon icon,
  void Function() action
});

class FolderControlView extends StatelessWidget {
  final FolderControlViewModel _vm;

  FolderControlView({
    required BehaviorSubject<FolderEntity> currentFolder,
    super.key,
  }) : _vm = FolderControlViewModel(currentFolder);

  @override
  Widget build(BuildContext context) {
    return PlatformPopupMenu(
      options: _buildFolderMenuOptions(),
      icon: const Icon(IconsConst.chevronDown),
    );
  }

  List<PopupMenuOption> _buildFolderMenuOptions() {
    final List<FolderControlOption> controlOptions = [
      (
        caption: 'New folder',
        icon: const Icon(IconsConst.plus),
        action: _createNewFolder,
      ),
      (
        caption: 'Rename folder',
        icon: const Icon(IconsConst.edit),
        action: _renameFolder,
      ),
      (
        caption: 'Remove folder',
        icon: const Icon(IconsConst.delete),
        action: _removeFolder,
      ),
    ];

    return controlOptions.map((option) {
      return PopupMenuOption(
        label: option.caption,
        onTap: (_) => option.action(),
      );
    }).toList();
  }

  void _createNewFolder() {} //TODO _createNewFolder

  void _renameFolder() {} //TODO _renameFolder

  void _removeFolder() {} //TODO _removeFolder
}
