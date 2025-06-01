import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:split_view/split_view.dart';

import '../../../../core/const/theme_const.dart';
import '../../../folder_management/presentation/change_notifiers/folder_path.dart';
import '../../../folder_management/presentation/change_notifiers/selected_folder.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        const double minWidthSideBar = 430.0;
        const double maxWidthSideBar = 600.0;

        final double totalWidth = constraints.maxWidth;

        final double sideBarWeight = minWidthSideBar / totalWidth;
        final double mainContentWeight = 1 - sideBarWeight;

        final double maxSideBarWeight = maxWidthSideBar / totalWidth;

        return SplitView(
          controller: SplitViewController(
            weights: [sideBarWeight, mainContentWeight],
            limits: [WeightLimit(min: sideBarWeight, max: maxSideBarWeight)],
          ),
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
      },
    );
  }
}

class _SideView extends StatelessWidget {
  const _SideView();

  @override
  Widget build(BuildContext context) {
    return const FolderStructureSideBar();
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
          PrioritizedsFilter(),
        ],
      ),
    );
  }
}

class _BreadCrumbsRow extends ConsumerWidget {
  const _BreadCrumbsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final folderPathAsync = ref.watch(folderPathProvider);

    return folderPathAsync.when(
      data: (folderPath) {
        final navigateFoFolder =
            ref.read(selectedFolderProvider.notifier).select;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Breadcrumbs(
                    folderPath: folderPath,
                    navigateFoFolder: navigateFoFolder,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: FolderControl(),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text('Failed to load breadcrumbs'),
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
