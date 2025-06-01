import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../../../../core/presentation/dialogs/confirmation_dialog.dart';
import '../../../folder_management/domain/entities/folder_entity.dart';
import '../../../folder_management/presentation/change_notifiers/folder_path.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
import '../../../folder_management/presentation/widgets/breadcrumbs.dart';
import '../../../folder_management/presentation/widgets/folder_tree.dart';
import '../../domain/entities/file_entity.dart';
import '../change_notifiers/file_operations.dart';

class FileInfoPopup extends ConsumerWidget {
  final FileEntity _fileEntity;

  const FileInfoPopup(this._fileEntity, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Dialog.fullscreen(
      backgroundColor: ThemeConsts.primaryBgColor,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: size.width * 0.9,
          maxHeight: size.height * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PopupTitle(_fileEntity.name),
            const SizedBox(height: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SideView(_fileEntity),
                  const SizedBox(width: 8.0),
                  _MainView(_fileEntity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SideView extends ConsumerWidget {
  final FileEntity _fileEntity;

  const _SideView(this._fileEntity);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: FoldersTreeView(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: PlatformElevatedButton(
              onPressed: () => ref.read(fileOperationsProvider.notifier).addFileToSelectedFolder(_fileEntity),
              child: const Text(
                'Add to selected folder',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopupTitle extends StatelessWidget {
  final String _caption;

  const _PopupTitle(this._caption);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 24, 0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _caption,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  final FileEntity _fileEntity;

  const _MainView(this._fileEntity);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white70,
        padding: const EdgeInsets.only(left: 32, top: 0, right: 16),
        child: Column(
          children: [
            _BreadcrumbsTable(_fileEntity),
          ],
        ),
      ),
    );
  }
}

class _BreadcrumbsTable extends ConsumerWidget {
  final FileEntity _fileEntity;

  const _BreadcrumbsTable(this._fileEntity);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allPathsAsync = ref.watch(allFolderPathsProvider(_fileEntity));

    return allPathsAsync.when(
      data: (allPaths) {
        print(allPaths);

        return DataTable(
          columns: _buildDataColumn(),
          rows: _buildRows(context, ref, allPaths),
        );
      },
      error: (error, stack) => const Center(
        child: Text('Failed to load paths to a file'),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  List<DataRow> _buildRows(
    BuildContext context,
    WidgetRef ref,
    List<List<FolderEntity>> allPaths,
  ) {
    final navigateFoFolder =
        ref.read(selectedFolderProvider.notifier).select;

    return allPaths
        .map(
          (filePath) => DataRow(
            cells: [
              DataCell(
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Breadcrumbs(
                    folderPath: filePath,
                    navigateFoFolder: navigateFoFolder,
                  ),
                ),
              ),
              DataCell(
                PlatformIconButton(
                  icon: const Icon(IconsConst.remove),
                  onPressed: () => _removeFileFromFolder(
                    context,
                    ref,
                    filePath.last.id,
                  ),
                ),
              )
            ],
          ),
        )
        .toList();
  }

  Future<void> _removeFileFromFolder(
    BuildContext context,
    WidgetRef ref,
    int folderId,
  ) async {
    final agreed = await showConfirmationDialog(
      context,
      'Remove file from folder',
      'Are you sure you want to remove file from this folder?',
    );

    if (agreed == null || !agreed) return;

    final removeFileFromSelectedFolder =
        ref.read(fileOperationsProvider.notifier).removeFileFromFolder;

    await removeFileFromSelectedFolder(_fileEntity.id, folderId);
  }

  List<DataColumn> _buildDataColumn() {
    final columnCaptions = [
      'Locations',
      'Remove from folder',
    ];

    return columnCaptions
        .map(
          (caption) => DataColumn(
            label: Expanded(child: Text(caption)),
          ),
        )
        .toList();
  }
}
