import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

import '../../../../core/const/theme_const.dart';
import '../../../folder_management/presentation/widgets/folder_structure_side_bar_widget.dart';
import '../../../prompt_analyzer/presentation/widgets/prompt_bar.dart';
import 'files_table_widget.dart';
import '../../../folder_management/presentation/widgets/breadcrumbs.dart';
import 'all_subfolders_checkbox.dart';
import 'favourites_filter.dart';
import 'files_search_field.dart';
import '../../../folder_management/presentation/widgets/folder_control.dart';

class FileManagementView extends StatelessWidget {
  const FileManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _SplitView(),
        Positioned(
          left: 16,
          right: 16,
          bottom: 32,
          child: PromptBar(),
        ),
      ],
    );
  }
}

class _SplitView extends StatelessWidget {
  const _SplitView();

  @override
  Widget build(BuildContext context) {
    return SplitView(
      gripColor: ThemeConsts.primaryLightColor,
      gripColorActive: ThemeConsts.primaryColor,
      gripSize: 8.0,
      indicator: const SplitIndicator(
        viewMode: SplitViewMode.Horizontal,
      ),
      activeIndicator: const SplitIndicator(
        viewMode: SplitViewMode.Horizontal,
        isActive: true,
      ),
      viewMode: SplitViewMode.Horizontal,
      children: const [
        _SideView(),
        Column(
          children: [
            _SearchBar(),
            Expanded(
              child: _MainView(),
            ),
          ],
        ),
      ],
    );
  }
}

class _SideView extends StatelessWidget {
  const _SideView();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      color: ThemeConsts.primaryBgColor,
      child: const FolderStructureSideBar(),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: const Column(
        children: [
          _BreadCrumbsRow(),
          Expanded(
            child: _FilesTable(),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeConsts.primaryBgColor,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: const Row(
        children: [
          Expanded(
            child: FilesSearchField(),
          ),
          SizedBox(width: 8.0),
          AllSubfoldersCheckbox(),
          SizedBox(width: 8.0),
          FavouritesFilter(),
        ],
      ),
    );
  }
}

class _BreadCrumbsRow extends StatelessWidget {
  const _BreadCrumbsRow();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Breadcrumbs(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: FolderControl(),
          ),
        ],
      ),
    );
  }
}

class _FilesTable extends StatelessWidget {
  const _FilesTable();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            ),
            child: const SingleChildScrollView(
              child: FilesTable(),
            ),
          ),
        );
      },
    );
  }
}
