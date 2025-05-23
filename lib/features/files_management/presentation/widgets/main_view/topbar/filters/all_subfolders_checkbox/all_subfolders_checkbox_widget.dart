import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../../../../core/presentation/const/theme_const.dart';
import 'all_subfolders_checkbox_vm.dart';

class AllSubfoldersCheckbox extends StatelessWidget {
  final _vm = AllSubfoldersCheckboxPresenter();

  AllSubfoldersCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ThemeConsts.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: _buildCheckbox(),
          ),
          const SizedBox(width: 8),
          _buildLabel(),
        ],
      ),
    );
  }

  Widget _buildCheckbox() {
    return StreamBuilder(
      stream: _vm.showSubfolderFiles,
      builder: (context, snapshot) {
        final isChecked = snapshot.data ?? false;

        return Checkbox(
          value: isChecked,
          onChanged: (_) => _vm.toggleShowSubfolderFiles(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          side: const BorderSide(color: Colors.white, width: 2),
        );
      },
    );
  }

  Widget _buildLabel() {
    return const Text(
      'Subfolder files',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
