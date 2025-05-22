import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/enums/folder_structure_mode.dart';
import 'folder_structure_control_vm.dart';

class FolderStructureControl extends StatelessWidget {
  final _vm = FolderStructureControlViewModel();

  FolderStructureControl({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _vm.currentFolderStructure,
      builder: (context, snapshot) {
        final currentFolderStructure =
            snapshot.data ?? FolderStructureMode.classified;

        return Platform.isMacOS
            ? _buildCupertinoSegmentedControl(currentFolderStructure)
            : _buildMaterialSegmentedButton(currentFolderStructure);
      },
    );
  }

  Widget _buildMaterialSegmentedButton(
      FolderStructureMode currentFolderStructure) {
    return SegmentedButton<FolderStructureMode>(
      segments: FolderStructureMode.values
          .map((mode) => _buildButtonSegment(mode))
          .toList(),
      selected: {currentFolderStructure},
      onSelectionChanged: (newSelection) =>
          _vm.onValueChanged(newSelection.first),
    );
  }

  ButtonSegment<FolderStructureMode> _buildButtonSegment(
    FolderStructureMode mode,
  ) {
    return ButtonSegment<FolderStructureMode>(
      value: mode,
      label: Text(mode.caption),
    );
  }

  Widget _buildCupertinoSegmentedControl(
      FolderStructureMode currentFolderStructure) {
    return CupertinoSegmentedControl<FolderStructureMode>(
      children: {
        for (var mode in FolderStructureMode.values)
          mode: _buildCupertinoSegment(mode),
      },
      groupValue: currentFolderStructure,
      onValueChanged: _vm.onValueChanged,
    );
  }

  Widget _buildCupertinoSegment(FolderStructureMode mode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        mode.caption,
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}
