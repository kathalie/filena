import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../core/const/icons_const.dart';
import '../../../domain/entities/file_entity.dart';
import '../../presenters/file_presenter.dart';

abstract class AbstractFileRow {
  final FilePresenter presenter;
  final Future<void> Function(int) _onToggleFavorite;
  final Widget Function(FileEntity) _buildInfoButton;

  AbstractFileRow(
    FileEntity fileEntity,
    Future<void> Function(int) onToggleFavorite,
    Widget Function(FileEntity) buildInfoButton,
  )   : presenter = FilePresenter(fileEntity),
        _onToggleFavorite = onToggleFavorite,
        _buildInfoButton = buildInfoButton;

  DataRow build();

  Widget buildFileIcon();

  List<DataCell> buildDataCells() {
    return [
      DataCell(buildFileIcon()),
      DataCell(_buildTextInfo(presenter.name)),
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
