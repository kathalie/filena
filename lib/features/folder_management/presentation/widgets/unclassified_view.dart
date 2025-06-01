import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../../../file_management/common/helpers/file_category.dart';
import '../../../file_management/presentation/change_notifiers/current_file_type.dart';

class UnclassifiedView extends ConsumerWidget {
  const UnclassifiedView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = [null, ...FileCategory.values];

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) => _CategoryWidget(categories[index]),
    );
  }
}

class _CategoryWidget extends ConsumerWidget {
  final FileCategory? _fileCategory;

  const _CategoryWidget(this._fileCategory);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFolderType = ref.watch(selectedFileCategoryProvider);

    final isSelected = selectedFolderType == _fileCategory;

    final selectCategory =
        ref.watch(selectedFileCategoryProvider.notifier).update;

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
        leading: _DirectoryIcon(_fileCategory),
        title: _DirectoryTitle(_fileCategory?.caption ?? 'All'),
        onTap: () => selectCategory(_fileCategory),
      ),
    );
  }
}

class _DirectoryIcon extends StatelessWidget {
  final FileCategory? _fileCategory;

  const _DirectoryIcon(this._fileCategory);

  @override
  Widget build(BuildContext context) {
    if (_fileCategory == null) {
      return const Icon(IconsConst.anyFolderSuggestion);
    }

    switch (_fileCategory) {
      case FileCategory.image:
        return const Icon(IconsConst.fileImage);
      case FileCategory.video:
        return const Icon(IconsConst.fileVideo);
      case FileCategory.audio:
        return const Icon(IconsConst.fileAudio);
      case FileCategory.document:
        return const Icon(IconsConst.fileDocument);
      case FileCategory.other:
        return const Icon(IconsConst.anyFolder);
    }
  }
}

class _DirectoryTitle extends StatelessWidget {
  final String _caption;

  const _DirectoryTitle(this._caption);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16,
      color: Colors.black54,
    );

    return Text(_caption, style: textStyle);
  }
}
