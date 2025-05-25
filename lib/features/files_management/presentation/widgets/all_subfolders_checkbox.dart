import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/theme_const.dart';
import '../change_notifiers/file_filters.dart';

class AllSubfoldersCheckbox extends StatelessWidget {
  const AllSubfoldersCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ThemeConsts.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: _Checkbox(),
          ),
          SizedBox(width: 8),
          _AllSubfoldersLabel(),
        ],
      ),
    );
  }
}

class _Checkbox extends ConsumerWidget {
  const _Checkbox();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doShowSubfolderFiles = ref.watch(filterStateProvider).showSubfolderFiles;
    final toggleShowSubfolderFiles =
        ref.read(filterStateProvider.notifier).toggleShowSubfolderFiles;

    return Checkbox(
      value: doShowSubfolderFiles,
      onChanged: (_) => toggleShowSubfolderFiles(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
      ),
      side: const BorderSide(color: Colors.white, width: 2),
    );
  }
}

class _AllSubfoldersLabel extends StatelessWidget {
  const _AllSubfoldersLabel();

  @override
  Widget build(BuildContext context) {
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
