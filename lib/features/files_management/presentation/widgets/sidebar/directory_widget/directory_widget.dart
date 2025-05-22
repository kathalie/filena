import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../../core/presentation/const/const.dart';
import '../../../../../../core/presentation/const/icons_const.dart';
import '../../../../../../core/presentation/const/theme_const.dart';
import '../../../../domain/entities/folder_entity.dart';
import 'directory_vm.dart';

class DirectoryWidget extends StatelessWidget {
  final DirectoryViewModel _vm;

  DirectoryWidget({
    required FolderEntity? folderEntity,
    required bool hasNestedFolders,
    super.key,
  }) : _vm = DirectoryViewModel(
          folderEntity: folderEntity,
          hasNestedFolders: hasNestedFolders,
        );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FolderEntity?>(
      stream: _vm.selectedFolder,
      builder: (context, snapshot) {
        final selectedFolder = snapshot.data;
        final isSelected = selectedFolder == _vm.folderEntity;

        return Card(
          elevation: 1,
          color: isSelected
              ? ThemeConsts.primaryLightColor
              : ThemeConsts.primaryBgColor,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: PlatformListTile(
            leading: _buildFolderIcon(context),
            title: _buildTitle(context),
            trailing: _buildExpandButton(context),
            onTap: () => _vm.selectFolder(_vm.folderEntity),
          ),
        );
      },
    );
  }

  Widget _buildFolderIcon(BuildContext context) {
    return _vm.isRoot
        ? const Icon(IconsConst.rootFolder)
        : const Icon(IconsConst.anyFolder);
  }

  Widget _buildTitle(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: _vm.isRoot ? FontWeight.w600 : FontWeight.w500,
      color: Colors.black54,
    );

    return _vm.isRoot
        ? Text(Const.rootFolderName, style: textStyle)
        : Text(_vm.name, style: textStyle);
  }

  Widget? _buildExpandButton(BuildContext context) {
    if (!_vm.hasNestedFolders) return null;

    return PlatformIconButton(
      icon: const Icon(IconsConst.chevronRight, color: ThemeConsts.primaryColor),
      padding: EdgeInsets.zero,
    );
  }
}
