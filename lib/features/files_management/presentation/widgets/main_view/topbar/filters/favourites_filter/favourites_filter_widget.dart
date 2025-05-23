import 'package:flutter/material.dart';

import '../../../../../../../../core/presentation/const/icons_const.dart';
import '../../../../../../../../core/presentation/const/theme_const.dart';
import 'favourites_filter_vm.dart';

class FavouritesFilter extends StatelessWidget {
  final _vm = FavouritesFilterPresenter();

  FavouritesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _vm.showOnlyFavourites, builder: (context, snapshot) {
      final onlyFavourites = snapshot.data ?? false;

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
          onPressed: _vm.toggleShowOnlyFavourites,
          padding: EdgeInsets.zero,
        ),
      );
    },);
  }
}