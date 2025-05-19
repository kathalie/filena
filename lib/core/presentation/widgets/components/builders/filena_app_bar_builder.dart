import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../const/theme_const.dart';
import '../app_logo.dart';
import '../buttons/notifications_button.dart';
import '../buttons/prompts_history_button.dart';
import '../buttons/upload_file_button.dart';

PlatformAppBar buildFilenaAppBar() {
  return PlatformAppBar(
    title: const Row(
      children: [
        FilenaLogo(),
        Spacer(),
      ],
    ),
    trailingActions: const [
      UploadFileButton(),
      PromptsHistoryButton(),
      NotificationsButton(),
    ],
  );
}
