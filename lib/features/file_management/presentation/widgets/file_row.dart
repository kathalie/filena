import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../core/const/icons_const.dart';
import '../../common/helpers/file_category.dart';
import '../../domain/entities/file_entity.dart';
import '../presenters/file_presenter.dart';

class SuggestionFileRow extends _FileRow {
  final int _colorHex;

  SuggestionFileRow(
    super.fileEntity,
    super.onToggleFavorite,
    super.buildInfoButton,
    int colorHex,
  ) : _colorHex = colorHex;

  @override
  DataRow build() {
    return DataRow(
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        return Color(_colorHex);
      }),
      cells: _buildDataCells(),
    );
  }

  @override
  Widget _buildFileIcon() {
    return switch (_presenter.fileCategory) {
      FileCategory.document => const Icon(IconsConst.fileDocumentSuggestion),
      FileCategory.image => const Icon(IconsConst.fileImageSuggestion),
      FileCategory.video => const Icon(IconsConst.fileVideoSuggestion),
      FileCategory.audio => const Icon(IconsConst.fileAudioSuggestion),
      FileCategory.other => const SizedBox(),
    };
  }
}

class FileRow extends _FileRow {
  FileRow(
    super.fileEntity,
    super.onToggleFavorite,
      super.buildInfoButton,
  );

  @override
  DataRow build() {
    return DataRow(
      cells: _buildDataCells(),
    );
  }

  @override
  Widget _buildFileIcon() {
    return switch (_presenter.fileCategory) {
      FileCategory.document => const Icon(IconsConst.fileDocument),
      FileCategory.image => const Icon(IconsConst.fileImage),
      FileCategory.video => const Icon(IconsConst.fileVideo),
      FileCategory.audio => const Icon(IconsConst.fileAudio),
      FileCategory.other => const SizedBox(),
    };
  }
}

abstract class _FileRow {
  final FilePresenter _presenter;
  final Future<void> Function(String) _onToggleFavorite;
  final Widget Function(String) _buildInfoButton;

  _FileRow(
    FileEntity fileEntity,
    Future<void> Function(String) onToggleFavorite,
    Widget Function(String) buildInfoButton,
  )   : _presenter = FilePresenter(fileEntity),
        _onToggleFavorite = onToggleFavorite,
        _buildInfoButton = buildInfoButton;

  DataRow build();

  Widget _buildFileIcon();

  List<DataCell> _buildDataCells() {
    return [
      DataCell(_buildFileIcon()),
      DataCell(_buildTextInfo(_presenter.name)),
      DataCell(_buildPrioritizedButton()),
      DataCell(_buildTextInfo(_presenter.size)),
      DataCell(_buildTextInfo(_presenter.lastModified)),
      DataCell(_buildTextInfo(_presenter.dateCreated)),
      DataCell(_buildInfoButton(_presenter.id)),
    ];
  }

  Widget _buildTextInfo(String caption) {
    return Text(caption);
  }

  Widget _buildPrioritizedButton() {
    final iconData = _presenter.isPrioritized
        ? IconsConst.starFilled
        : IconsConst.starOutline;

    return PlatformIconButton(
      icon: Icon(iconData),
      onPressed: () async => await _onToggleFavorite(_presenter.id),
    );
  }
}
