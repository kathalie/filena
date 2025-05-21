import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../features/files_management/presentation/file_management_view.dart';
import 'components/builders/filena_app_bar_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: buildFilenaAppBar(),
      body: FileManagementView(),
    );
  }
}
