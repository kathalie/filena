import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../../../core/presentation/const/icons_const.dart';
import '../../../../../domain/entities/file_entity.dart';
import '../../../../../domain/enums/file_category.dart';
import 'file_row_vm.dart';

class FileRow {
  final FileRowPresenter _vm;
  
  FileRow(FileEntity fileEntity): _vm = FileRowPresenter(fileEntity);
  
  DataRow build() {
    return DataRow(
      cells: <DataCell>[
        DataCell(_buildFileIcon()),
        DataCell(_buildTextInfo(_vm.name)),
        DataCell(_buildFavouriteButton()),
        DataCell(_buildTextInfo(_vm.size)),
        DataCell(_buildTextInfo(_vm.lastModified)),
        DataCell(_buildTextInfo(_vm.dateCreated)),
        DataCell(_buildInfoButton()),
      ],
    ); 
  }

  Widget _buildFileIcon() {
    return switch(_vm.fileCategory) {
      FileCategory.document => const Icon(IconsConst.fileDocument),
      FileCategory.image => const Icon(IconsConst.fileImage),
      FileCategory.video => const Icon(IconsConst.fileVideo),
      FileCategory.audio => const Icon(IconsConst.fileAudio),
      FileCategory.other => const SizedBox(),
    };
  }

  Widget _buildTextInfo(String caption) {
    return Text(caption);
  }

  Widget _buildFavouriteButton() {
    final iconData = _vm.isFavourite ? IconsConst.starFilled : IconsConst.starOutline;

    return PlatformIconButton(
      icon: Icon(iconData),
      onPressed: () async => await _vm.toggleFavourite(),
    );
  }

  Widget _buildInfoButton() {
    return PlatformIconButton(
      icon: const Icon(IconsConst.moreInfo),
      onPressed: () {}, //TODO open file info
    );
  }
}