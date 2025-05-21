import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../../core/presentation/const/icons_const.dart';
import 'directory_vm.dart';

class DirectoryWidget extends StatelessWidget {
  final DirectoryViewModel _vm;

  final VoidCallback? onPressed;

  DirectoryWidget({
    required String name,
    required bool hasNestedFolders,
    // required bool isExpanded,
    this.onPressed,
    super.key,
  }) : _vm = DirectoryViewModel(
          name: name,
          hasNestedFolders: hasNestedFolders,
          initialIsExpanded: false,
        );

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(_vm.directoryName);

    return StreamBuilder<bool>(
      stream: _vm.isExpanded,
      builder: (context, snapshot) {
        final isExpanded = snapshot.data ?? false;

        return Card(
          child: PlatformListTile(
            leading: _buildFolderIcon(),
            title: titleWidget,
            trailing: _buildExpandButton(isExpanded),
          ),
        );
      },
    );
  }

  Icon _buildFolderIcon() => const Icon(IconsConst.anyFolder);

  Widget? _buildExpandButton(bool isExpanded) {
    if (!_vm.hasNestedFolders) return null;

    return PlatformIconButton(
      icon: _buildChevronIcon(isExpanded),
      onPressed: onPressed,
    );
  }

  Icon _buildChevronIcon(bool isExpanded) {
    return isExpanded
        ? const Icon(IconsConst.chevronDown)
        : const Icon(IconsConst.chevronRight);
  }
}
