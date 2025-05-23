import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

import '../../../core/presentation/const/theme_const.dart';
import '../../folders_suggestion/presentation/prompt_bar/prompt_bar_widget.dart';
import 'widgets/main_view/files_table/files_table_widget.dart';
import 'widgets/main_view/topbar/breadcrumbs/breadcrumbs_widget.dart';
import 'widgets/main_view/topbar/filters/all_subfolders_checkbox/all_subfolders_checkbox_widget.dart';
import 'widgets/main_view/topbar/filters/favourites_filter/favourites_filter_widget.dart';
import 'widgets/main_view/topbar/filters/search_field/files_search_field_widget.dart';
import 'widgets/main_view/topbar/folder_control/folder_control_widget.dart';
import 'widgets/sidebar/folder_structure_side_bar_widget.dart';

class FileManagementView extends StatelessWidget {
  const FileManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildSplitView(),
        Positioned(
          left: 16,
          right: 16,
          bottom: 32,
          child: PromptBar(),
        ),
      ],
    );
  }

  Widget _buildSplitView() {
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
      children: [
        _buildSideView(),
        Column(
          children: [
            _buildSearchBar(),
            Expanded(
              child: _buildMainView(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSideView() {
    return Container(
      width: 350,
      color: ThemeConsts.primaryBgColor,
      child: FolderStructureSideBar(),
    );
  }

  Widget _buildMainView() {
    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          _buildBreadcrumbsRow(),
          Expanded(
            child: _buildFilesTable(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: ThemeConsts.primaryBgColor,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: FilesSearchField(),
          ),
          const SizedBox(width: 8.0),
          AllSubfoldersCheckbox(),
          const SizedBox(width: 8.0),
          FavouritesFilter(),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BreadcrumbsView(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FolderControl(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilesTable() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
            ),
            child: SingleChildScrollView(
              child: FilesTable(),
            ),
          ),
        );
      },
    );
  }
}
