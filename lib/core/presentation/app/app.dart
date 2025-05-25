import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../const/theme_const.dart';
import '../pages/home_page.dart';


class FilenaApp extends StatefulWidget {
  const FilenaApp({super.key});

  @override
  State<FilenaApp> createState() => _FilenaAppState();
}

class _FilenaAppState extends State<FilenaApp> {
  ThemeMode? themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
      builder: (context) => PlatformTheme(
        themeMode: themeMode,
        materialLightTheme: ThemeConsts.materialLightTheme,
        cupertinoLightTheme: ThemeConsts.cupertinoLightTheme,
        onThemeModeChanged: (themeMode) {
          this.themeMode = themeMode;
        },
        builder: (context) => const PlatformApp(
          debugShowCheckedModeBanner: false,
          title: 'Filena - Your smart file manager',
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          home: HomePage(),
        ),
      ),
      // ),
    );
  }
}
