import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../organizing_assistant/presentation/widgets/suggestions_list_widget.dart';
import '../../domain/types/folder_structure_mode.dart';
import '../change_notifiers/folder_structure_mode.dart';
import 'folder_tree.dart';
import 'folder_structure_control.dart';

class FolderStructureSideBar extends ConsumerWidget {
  const FolderStructureSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(folderStructureModeProvider);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: FolderStructureControl(),
          ),
        ),
        _BarContent(mode),
      ],
    );
  }
}

class _BarContent extends StatelessWidget {
  final FolderStructureMode _mode;

  const _BarContent(this._mode);

  @override
  Widget build(BuildContext context) {
    return switch (_mode) {
      FolderStructureMode.classified => Expanded(child: FoldersTreeView()),
      //TODO unclassified view
      FolderStructureMode.unclassified => Expanded(child: Placeholder()),
      FolderStructureMode.suggestions => Expanded(child: SuggestionsView()),
    };
  }
}
