import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../const/icons_const.dart';

class PromptsHistoryButton extends StatefulWidget {
  const PromptsHistoryButton({super.key});

  @override
  State<PromptsHistoryButton> createState() => _PromptsHistoryButtonState();
}

class _PromptsHistoryButtonState extends State<PromptsHistoryButton> {
  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      icon: const Icon(IconsConst.history),
      onPressed: () {}, // TODO open prompts history popup
    );
  }
}