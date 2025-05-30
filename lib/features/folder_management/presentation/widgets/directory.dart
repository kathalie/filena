import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../../domain/entities/folder_entity.dart';
import '../change_notifiers/selected_folder.dart';
import '../presenters/folder_presenter.dart';

class DirectoryWidget extends ConsumerWidget {
  final FolderPresenter _presenter;
  final void Function() _toggleExpansion;
  final bool _isExpanded;

  DirectoryWidget({
    required FolderEntity folderEntity,
    required bool hasNestedFolders,
    required void Function() toggleExpansion,
    required bool isExpanded,
    super.key,
  })  : _presenter = FolderPresenter(
          folderEntity: folderEntity,
          hasNestedFolders: hasNestedFolders,
        ),
        _toggleExpansion = toggleExpansion,
        _isExpanded = isExpanded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFolderAsync = ref.watch(selectedFolderProvider);

    return selectedFolderAsync.when(
      data: (selectedFolder) {
        final isSelected = selectedFolder == _presenter.folderEntity;

        final selectFolder = ref.watch(selectedFolderProvider.notifier).select;

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
            trailing: _presenter.hasNestedFolders
                ? _ExpandButton(_toggleExpansion, _isExpanded)
                : null,
            onTap: () => selectFolder(_presenter.folderEntity),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text('Failed to load breadcrumbs'),
      ),
    );
  }
}

class _DirectoryIcon extends StatelessWidget {
  final FolderPresenter _presenter;

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
  final FolderPresenter _presenter;

  const _DirectoryTitle(this._presenter);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 16,
      fontWeight: _presenter.isRoot ? FontWeight.w700 : FontWeight.w500,
      color: Colors.black54,
    );

    return Text(_presenter.name, style: textStyle);
  }
}

class _ExpandButton extends StatelessWidget {
  final void Function() _toggleExpansion;
  final bool _isExpanded;

  const _ExpandButton(this._toggleExpansion, this._isExpanded);

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      icon: Icon(
        _isExpanded ? IconsConst.chevronDown : IconsConst.chevronRight,
        color: ThemeConsts.primaryColor,
      ),
      padding: EdgeInsets.zero,
      onPressed: _toggleExpansion,
    );
  }
}
