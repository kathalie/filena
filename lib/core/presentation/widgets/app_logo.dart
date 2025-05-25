import 'package:flutter/material.dart';

import '../../const/icons_const.dart';
import '../../const/theme_const.dart';

class FilenaLogo extends StatelessWidget {
  const FilenaLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            IconsConst.magicWand,
            size: 24,
          ),
          SizedBox(width: 16.0),
          Text(
            'Filena',
            style: TextStyle(
              color: ThemeConsts.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
