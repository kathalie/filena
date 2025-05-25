import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../features/files_management/presentation/widgets/upload_file_button.dart';
import '../widgets/app_logo.dart';
import '../widgets/prompts_history_button.dart';

PlatformAppBar buildFilenaAppBar() {
  return PlatformAppBar(
    title: const Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          FilenaLogo(),
          Spacer(),
        ],
      ),
    ),
    trailingActions: const [
      SizedBox(width: 8),
      UploadFileButton(),
      SizedBox(width: 12),
      PromptsHistoryButton(),
      SizedBox(width: 8),
    ],
  );
}
