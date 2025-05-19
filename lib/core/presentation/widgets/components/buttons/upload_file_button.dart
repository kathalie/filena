import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../../const/icons_const.dart';

class UploadFileButton extends StatefulWidget {
  const UploadFileButton({super.key});

  @override
  State<UploadFileButton> createState() => _UploadFileButtonState();
}

class _UploadFileButtonState extends State<UploadFileButton> {
  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      icon: const Icon(IconsConst.upload),
      onPressed: () {}, // TODO open file uploader
    );
  }
}
