import 'package:flutter/material.dart';

import '../../../../../core/const/icons_const.dart';
import '../../../common/helpers/file_category.dart';
import 'abstract_file_row.dart';

class SuggestedFileRow extends AbstractFileRow {
  final int _colorHex;

  SuggestedFileRow(
      super.fileEntity,
      super.onToggleFavorite,
      super.onOpenFile,
      super.buildInfoButton,
      int colorHex,
      ) : _colorHex = colorHex;

  @override
  DataRow build() {
    return DataRow(
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        return Color(_colorHex);
      }),
      cells: buildDataCells(),
    );
  }

  @override
  Widget buildFileIcon() {
    return switch (presenter.fileCategory) {
      FileCategory.document => const Icon(IconsConst.fileDocumentSuggestion),
      FileCategory.image => const Icon(IconsConst.fileImageSuggestion),
      FileCategory.video => const Icon(IconsConst.fileVideoSuggestion),
      FileCategory.audio => const Icon(IconsConst.fileAudioSuggestion),
      FileCategory.other => const SizedBox(),
    };
  }
}