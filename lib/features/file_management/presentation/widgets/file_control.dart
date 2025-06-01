import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../../../../core/presentation/dialogs/confirmation_dialog.dart';
import '../../../../core/presentation/dialogs/text_field_dialog.dart';
import '../../api/providers.dart';
import '../../domain/entities/file_entity.dart';
import '../change_notifiers/file_operations.dart';
import 'file_info_popup.dart';

typedef FileControlOption = ({
  String caption,
  Icon icon,
  void Function() action
});

class FileControl extends ConsumerWidget {
  final FileEntity _fileEntity;

  const FileControl(this._fileEntity, {super.key});

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
        caption: 'Folders',
        icon: IconsConst.anyFolderSuggestion,
        action: () => _openFileInfoPopup(context, ref),
      ),
      (
        caption: 'Rename file',
        icon: IconsConst.edit,
        action: () async => await _renameFile(context, ref),
      ),
      (
        caption: 'Remove file from this folder',
        icon: IconsConst.remove,
        action: () async => await _removeFileFromSelectedFolder(context, ref),
      ),
      (
        caption: 'Delete file from system',
        icon: IconsConst.delete,
        action: () async => await _deleteFileFromSystem(context, ref),
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

  void _openFileInfoPopup(
    BuildContext context,
    WidgetRef ref,
  ) {
    showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return FileInfoPopup(_fileEntity);
      },
    );
  }

  Future<void> _renameFile(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final newFileName = await showTextFieldDialog(
      context,
      title: 'Rename file',
      inputHint: 'New file name...',
      initialValue: _fileEntity.name,
    );

    if (newFileName == null) return;

    final renameFile = ref.read(fileRepositoryProvider).renameFile;

    await renameFile(_fileEntity.id, newFileName);
  }

  Future<void> _removeFileFromSelectedFolder(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final agreed = await showConfirmationDialog(
      context,
      'Remove file from folder',
      'Are you sure you want to remove this file from folder?',
    );

    if (agreed == null || !agreed) return;

    final removeFileFromSelectedFolder =
        ref.read(fileOperationsProvider.notifier).removeFileFromSelectedFolder;

    await removeFileFromSelectedFolder(_fileEntity.id);
  }

  Future<void> _deleteFileFromSystem(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final agreed = await showConfirmationDialog(
      context,
      'Delete folder',
      'Are you sure you want to permanently delete this file from the system?',
    );

    if (agreed == null || !agreed) return;

    final deleteFileFromSystem =
        ref.read(fileOperationsProvider.notifier).deleteFileFromSystem;

    await deleteFileFromSystem(_fileEntity.id);
  }
}
