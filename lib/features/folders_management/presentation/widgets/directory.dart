import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/const.dart';
import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../../domain/entities/folder_entity.dart';
import '../change_notifiers/selected_folder.dart';
import '../presenters/directory_presenter.dart';

class DirectoryWidget extends ConsumerWidget {
  final DirectoryPresenter _presenter;

  DirectoryWidget({
    required FolderEntity? folderEntity,
    required bool hasNestedFolders,
    super.key,
  }) : _presenter = DirectoryPresenter(
          folderEntity: folderEntity,
          hasNestedFolders: hasNestedFolders,
        );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFolder = ref.watch(selectedFolderProvider);
    final isSelected = selectedFolder == _presenter.folderEntity;

    final selectFolder =
        ref.watch(selectedFolderProvider.notifier).select;

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
        leading: _DirectoryIcon(_presenter),
        title: _DirectoryTitle(_presenter),
        trailing: _presenter.hasNestedFolders ? const _ExpandButton() : null,
        onTap: () => selectFolder(_presenter.folderEntity),
      ),
    );
  }
}

class _DirectoryIcon extends StatelessWidget {
  final DirectoryPresenter _presenter;

  const _DirectoryIcon(this._presenter);

  @override
  Widget build(BuildContext context) {
    if (_presenter.isPending) return const Icon(IconsConst.anyFolderSuggestion);

    return _presenter.isRoot
        ? const Icon(IconsConst.rootFolder)
        : const Icon(IconsConst.anyFolder);
  }
}

class _DirectoryTitle extends StatelessWidget {
  final DirectoryPresenter _presenter;

  const _DirectoryTitle(this._presenter);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: _presenter.isRoot ? FontWeight.w600 : FontWeight.w500,
      color: Colors.black54,
    );

    return _presenter.isRoot
        ? Text(Const.rootFolderName, style: textStyle)
        : Text(_presenter.name, style: textStyle);
  }
}

class _ExpandButton extends StatelessWidget {
  const _ExpandButton();

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      icon: const Icon(
        IconsConst.chevronRight,
        color: ThemeConsts.primaryColor,
      ),
      padding: EdgeInsets.zero,
    );
  }
}
