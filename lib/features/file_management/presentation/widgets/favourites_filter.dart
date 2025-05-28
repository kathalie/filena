import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../change_notifiers/file_filters.dart';

class PrioritizedsFilter extends ConsumerWidget {
  const PrioritizedsFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlyPrioritized = ref.watch(filterStateProvider).showOnlyFavorites;
    final toggleOnlyPrioritizeds =
        ref.read(filterStateProvider.notifier).toggleShowOnlyFavorites;

    return Container(
      decoration: BoxDecoration(
        color: ThemeConsts.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: IconButton(
        icon: Icon(
          onlyPrioritized ? IconsConst.starFilled : IconsConst.starOutline,
          color: Colors.white,
          size: 18,
        ),
        onPressed: toggleOnlyPrioritizeds,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
