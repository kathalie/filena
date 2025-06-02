import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../core/const/icons_const.dart';
import '../../../domain/entities/file_entity.dart';
import '../../presenters/file_presenter.dart';

abstract class AbstractFileRow {
  final FilePresenter presenter;
  final Future<void> Function(int) _onToggleFavorite;
  final Future<void> Function(int) _onOpenFile;
  final Widget Function(FileEntity) _buildInfoButton;

  AbstractFileRow(
    FileEntity fileEntity,
    Future<void> Function(int) onToggleFavorite,
    Future<void> Function(int) onOpenFile,
    Widget Function(FileEntity) buildInfoButton,
  )   : presenter = FilePresenter(fileEntity),
        _onToggleFavorite = onToggleFavorite,
        _onOpenFile = onOpenFile,
        _buildInfoButton = buildInfoButton;

  DataRow build();

  Widget buildFileIcon();

  List<DataCell> buildDataCells() {
    return [
      DataCell(buildFileIcon()),
      DataCell(_FileName(presenter.fileEntity, _onOpenFile)),
      DataCell(_buildPrioritizedButton()),
      DataCell(_buildTextInfo(presenter.size)),
      DataCell(_buildTextInfo(presenter.lastModified)),
      DataCell(_buildTextInfo(presenter.dateCreated)),
      DataCell(_buildInfoButton(presenter.fileEntity)),
    ];
  }

  Widget _buildTextInfo(String caption) {
    return Text(caption);
  }

  Widget _buildPrioritizedButton() {
    final iconData = presenter.isPrioritized
        ? IconsConst.starFilled
        : IconsConst.starOutline;

    return PlatformIconButton(
      icon: Icon(iconData),
      onPressed: () async => await _onToggleFavorite(presenter.id),
    );
  }
}

class _FileName extends StatelessWidget {
  final FileEntity _fileEntity;
  final Future<void> Function(int) _onOpenFile;

  const _FileName(
    this._fileEntity,
    this._onOpenFile,
  );

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      // onPressed: () => _handleOpenFile(
      //   context,
      //   _fileEntity,
      //   _onOpenFile,
      // ),
      onPressed: () => _onOpenFile(_fileEntity.id),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        _fileEntity.name,
        style: const TextStyle(inherit: false, color: Colors.black87),
      ),
    );
  }

// Future<void> _handleOpenFile(
//   BuildContext context,
//   FileEntity fileEntity,
//   Future<void> Function(int) onOpenFile,
// ) async {
//   try {
//     await onOpenFile(fileEntity.id);
//   } catch (e) {
//     if (context.mounted) {
//       SnackbarUtil.showError(
//         context: context,
//         message: 'Failed to open file',
//         onRetry: () => _handleOpenFile(context, fileEntity, onOpenFile),
//       );
//     }
//
//     print(e);
//   }
// }
}
