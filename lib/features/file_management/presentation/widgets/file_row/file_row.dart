import 'package:flutter/material.dart';

import '../../../../../core/const/icons_const.dart';
import '../../../common/helpers/file_category.dart';
import 'abstract_file_row.dart';

class FileRow extends AbstractFileRow {
  FileRow(
      super.fileEntity,
      super.onToggleFavorite,
      super.onOpenFile,
      super.buildInfoButton,
      );

  @override
  DataRow build() {
    return DataRow(
      cells: buildDataCells(),
    );
  }

  @override
  Widget buildFileIcon() {
    return switch (presenter.fileCategory) {
      FileCategory.document => const Icon(IconsConst.fileDocument),
      FileCategory.image => const Icon(IconsConst.fileImage),
      FileCategory.video => const Icon(IconsConst.fileVideo),
      FileCategory.audio => const Icon(IconsConst.fileAudio),
      FileCategory.other => const SizedBox(),
    };
  }
}