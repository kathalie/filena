import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/types/folder_structure_mode.dart';
import '../change_notifiers/folder_structure_mode.dart';

class FolderStructureControl extends StatelessWidget {
  const FolderStructureControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isMacOS
        ? const _CupertinoSegmentedControl()
        : const _MaterialSegmentedControl();
  }
}

class _MaterialSegmentedControl extends ConsumerWidget {
  const _MaterialSegmentedControl();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(folderStructureModeProvider);
    final changeMode = ref.read(folderStructureModeProvider.notifier).update;

    return SegmentedButton<FolderStructureMode>(
      segments: FolderStructureMode.values
          .map((mode) => _buildMaterialSegment(mode))
          .toList(),
      selected: {mode},
      onSelectionChanged: (newSelection) =>
          changeMode(newSelection.first),
    );
  }

  ButtonSegment<FolderStructureMode> _buildMaterialSegment(
      FolderStructureMode mode,
      ) {
    return ButtonSegment<FolderStructureMode>(
      value: mode,
      label: Text(mode.caption),
    );
  }
}


class _CupertinoSegmentedControl extends ConsumerWidget {
  const _CupertinoSegmentedControl();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(folderStructureModeProvider);
    final changeMode = ref.read(folderStructureModeProvider.notifier).update;

    return CupertinoSegmentedControl<FolderStructureMode>(
      children: {
        for (var mode in FolderStructureMode.values)
          mode: _CupertinoSegment(mode),
      },
      groupValue: mode,
      onValueChanged: changeMode,
    );
  }
}

class _CupertinoSegment extends StatelessWidget {
  final FolderStructureMode _mode;

  const _CupertinoSegment(this._mode);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        _mode.caption,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}

