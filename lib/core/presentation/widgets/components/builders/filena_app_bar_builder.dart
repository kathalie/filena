import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../../../features/files_management/presentation/widgets/buttons/upload_file_button_widget.dart';
import '../app_logo.dart';
import '../buttons/notifications_button.dart';
import '../buttons/prompts_history_button.dart';

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
    trailingActions: [
      const SizedBox(width: 8),
      UploadFileButton(),
      const SizedBox(width: 12),
      PromptsHistoryButton(),
      const SizedBox(width: 12),
      NotificationsButton(),
      const SizedBox(width: 8),
    ],
  );
}
