import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../organizing_assistant/presentation/change_notifiers/all_folder_suggestions.dart';
import '../../domain/types/folder_structure_mode.dart';
import '../change_notifiers/folder_structure_mode.dart';

class FolderStructureControl extends StatelessWidget {
  const FolderStructureControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Platform.isMacOS
            ? const _CupertinoSegmentedControl()
            : const _MaterialSegmentedControl(),
        const Positioned(
          top: -5,
          right: 20,
          child: _SuggestionsBadge(),
        ),
      ],
    );
  }
}

class _SuggestionsBadge extends ConsumerWidget {
  const _SuggestionsBadge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionsAsync = ref.watch(allSuggestionsProvider);


    return suggestionsAsync.when(
      data: (suggestions) {
        final suggestionsCount = suggestions.length;

        if (suggestionsCount == 0) {
          return const SizedBox();
        }

        return Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            color: Color(0xFF40E0D0),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              suggestionsCount > 99 ? '99+' : suggestionsCount.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
      loading: () => const SizedBox(),
      error: (error, stack) => const SizedBox(),
    );
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
      onSelectionChanged: (newSelection) => changeMode(newSelection.first),
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
