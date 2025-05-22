import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../../core/presentation/const/const.dart';
import '../../../../../../core/presentation/const/icons_const.dart';
import 'directory_vm.dart';

class DirectoryWidget extends StatelessWidget {
  final DirectoryViewModel _vm;
  final VoidCallback? onPressed;

  DirectoryWidget({
    required DirectoryCharacteristics characteristics,
    this.onPressed,
    super.key,
  }) : _vm = DirectoryViewModel(
    characteristics: characteristics,
    initialIsExpanded: false,
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _vm.isExpanded,
      builder: (context, snapshot) {
        final isExpanded = snapshot.data ?? false;

        return Card(
          elevation: 1,
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: PlatformListTile(
            leading: _buildFolderIcon(context),
            title: _buildTitle(context),
            trailing: _buildExpandButton(context, isExpanded),
            onTap: onPressed, // Make the entire tile tappable
          ),
        );
      },
    );
  }

  Widget _buildFolderIcon(BuildContext context) {
    return _vm.characteristics.isRoot
        ? const Icon(IconsConst.rootFolder)
        : const Icon(IconsConst.anyFolder);
  }

  Widget _buildTitle(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: _vm.characteristics.isRoot ? FontWeight.w600 : FontWeight.w500,
      color: Colors.black54,
    );

    return _vm.characteristics.isRoot
        ? Text(Const.rootFolderName, style: textStyle)
        : Text(_vm.characteristics.name, style: textStyle);
  }

  Widget? _buildExpandButton(BuildContext context, bool isExpanded) {
    if (!_vm.characteristics.hasNestedFolders) return null;

    final iconWidget = isExpanded
        ? Icon(IconsConst.chevronDown, color: Theme.of(context).primaryColor)
        : Icon(IconsConst.chevronRight, color: Theme.of(context).primaryColor);

    return PlatformIconButton(
      icon: iconWidget,
      onPressed: onPressed,
      padding: EdgeInsets.zero, // More compact
    );
  }
}
