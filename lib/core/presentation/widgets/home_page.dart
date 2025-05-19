import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../const/theme_const.dart';
import 'components/builders/filena_app_bar_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: buildFilenaAppBar(),
      body: Row(
        children: [
          Container(
            width: 220,
            color: ThemeConsts.primaryBgColor,
            child: Column(
              children: [
                Placeholder(), // TODO Sidebar
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: ThemeConsts.primaryBgColor,
              child: Placeholder(), // TODO Main content
            ),
          ),
        ],
      ),
    );
  }
}
