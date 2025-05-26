import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/const/icons_const.dart';
import '../../../../core/const/theme_const.dart';
import '../change_notifiers/file_filters.dart';

class FavouritesFilter extends ConsumerWidget {
  const FavouritesFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlyFavourites = ref.watch(filterStateProvider).showOnlyFavorites;
    final toggleOnlyFavourites =
        ref.read(filterStateProvider.notifier).toggleShowOnlyFavorites;

    return Container(
      decoration: BoxDecoration(
        color: ThemeConsts.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: IconButton(
        icon: Icon(
          onlyFavourites ? IconsConst.starFilled : IconsConst.starOutline,
          color: Colors.white,
          size: 18,
        ),
        onPressed: toggleOnlyFavourites,
        padding: EdgeInsets.zero,
      ),
    );
  }
}
