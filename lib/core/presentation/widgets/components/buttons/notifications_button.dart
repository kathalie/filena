import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../const/icons_const.dart';

class NotificationsButton extends StatefulWidget {
  const NotificationsButton({super.key});

  @override
  State<NotificationsButton> createState() => _NotificationsButtonState();
}

class _NotificationsButtonState extends State<NotificationsButton> {
  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      icon: const Icon(IconsConst.notifications),
      onPressed: () {}, // TODO show notification popups
    );
  }
}