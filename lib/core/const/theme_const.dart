import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'const.dart';

class ThemeConsts {
  static const Color primaryColor = Color(0xFF6971D9);
  static const Color primaryBgColor = Color.fromARGB(255, 242, 242, 253);
  static const Color primaryLightColor = Color(Const.primaryLightColorHex);

  static final materialLightTheme = ThemeData.light();
  static const cupertinoLightTheme = CupertinoThemeData(
    primaryColor: primaryColor,
    barBackgroundColor: primaryBgColor,
    scaffoldBackgroundColor: primaryBgColor,
    primaryContrastingColor: Colors.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: primaryColor,
    ),
  );
}
