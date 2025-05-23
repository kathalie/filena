import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeConsts {
  static const Color primaryColor = Color(0xFF6971D9);
  static const Color primaryBgColor = Color.fromARGB(255, 242, 242, 253);
  static const Color primaryLightColor = Color(0xFFced0f8);

  // static const Color accentColor = Color(0xFF4ECDC4);
  // static const Color errorColor = Color(0xFFFF6B6B);
  // static const Color warningColor = Color(0xFFFFD166);

  // static const Color lightBackground = Color(0xFFFAFAFA);
  // static const Color darkBackground = Color(0xFF1E1E1E);
  // static const Color cardLightColor = Colors.white;
  // static const Color cardDarkColor = Color(0xFF2C2C2C);

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

  // static ThemeData _materialLightTheme() {
  //   final base = ThemeData.light();
  //
  //   return base.copyWith(
  //     colorScheme: const ColorScheme.light(
  //       primary: primaryColor,
  //       primaryContainer: primaryBgColor,
  //       secondary: primaryLightColor,
  //       error: errorColor,
  //       surface: primaryBgColor,
  //       onPrimary: Colors.white,
  //       onSecondary: Colors.black,
  //       onSurface: Colors.black87,
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         // side: const BorderSide(color: Colors.white),
  //         foregroundColor: Colors.white,
  //         backgroundColor: primaryColor,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //       ),
  //     ),
  //     iconButtonTheme: IconButtonThemeData(
  //       style: IconButton.styleFrom(
  //         iconSize: 24,
  //         backgroundColor: Colors.white,
  //         foregroundColor: Colors.white,
  //       ),
  //     ),
  //     iconTheme: IconThemeData(
  //       color: Colors.grey.shade700,
  //       size: 24,
  //     ),
  //     primaryIconTheme: const IconThemeData(
  //       color: Colors.white,
  //     ),
      // inputDecorationTheme: InputDecorationTheme(
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(8),
      //     borderSide: BorderSide(color: Colors.grey.shade300),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(8),
      //     borderSide: const BorderSide(color: primaryColor),
      //   ),
      //   filled: true,
      //   fillColor: Colors.grey.shade50,
      //   contentPadding:
      //       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      // ),
      // checkboxTheme: CheckboxThemeData(
      //   fillColor: MaterialStateProperty.resolveWith<Color>((states) {
      //     if (states.contains(MaterialState.selected)) {
      //       return primaryColor;
      //     }
      //     return Colors.grey.shade400;
      //   }),
      // ),
      // popupMenuTheme: PopupMenuThemeData(
      //   elevation: 3,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      // ),
      // dividerTheme: DividerThemeData(
      //   color: Colors.grey.shade200,
      //   thickness: 1,
      // ),
      // tabBarTheme: TabBarTheme(
      //   labelColor: primaryColor,
      //   unselectedLabelColor: Colors.grey.shade700,
      //   indicator: const BoxDecoration(
      //     border: Border(
      //       bottom: BorderSide(
      //         color: primaryColor,
      //         width: 2,
      //       ),
      //     ),
      //   ),
      // ),

      // textTheme: _buildTextTheme(base.textTheme, Colors.black87),
      // primaryTextTheme: _buildTextTheme(base.primaryTextTheme, Colors.white),
    // );
  // }

  // static TextTheme _buildTextTheme(TextTheme base, Color color) {
  //   return base.copyWith(
  //     displayLarge: base.displayLarge!.copyWith(color: color),
  //     displayMedium: base.displayMedium!.copyWith(color: color),
  //     displaySmall: base.displaySmall!.copyWith(color: color),
  //     headlineLarge: base.headlineLarge!.copyWith(color: color),
  //     headlineMedium: base.headlineMedium!.copyWith(color: color),
  //     headlineSmall: base.headlineSmall!.copyWith(color: color),
  //     titleLarge: base.titleLarge!.copyWith(color: color),
  //     titleMedium: base.titleMedium!.copyWith(color: color),
  //     titleSmall: base.titleSmall!.copyWith(color: color),
  //     bodyLarge: base.bodyLarge!.copyWith(color: color),
  //     bodyMedium: base.bodyMedium!.copyWith(color: color),
  //     bodySmall: base.bodySmall!.copyWith(color: color),
  //     labelLarge: base.labelLarge!.copyWith(color: color),
  //     labelMedium: base.labelMedium!.copyWith(color: color),
  //     labelSmall: base.labelSmall!.copyWith(color: color),
  //   );
  // }
}
