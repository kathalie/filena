import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<String?> showTextFieldDialog(
  BuildContext context,
  String title,
  String inputHint,
) {
  final TextEditingController controller = TextEditingController();

  return showDialog<String>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: _buildTitleText(title),
        titlePadding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        content: _buildInputField(controller, inputHint),
        actions: [
          _buildCancelAction(context),
          _buildConfirmAction(context, controller),
        ],
      );
    },
  );
}

Widget _buildTitleText(String title) {
  return Text(
    title,
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}

Widget _buildInputField(TextEditingController controller, String hint) {
  return TextField(
    controller: controller,
    autofocus: true,
    decoration: InputDecoration(
      hintText: hint,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    ),
    onSubmitted: (value) => _handleSubmit(value),
  );
}

void _handleSubmit(String value, [BuildContext? context]) {
  if (value.trim().isNotEmpty && context != null) {
    Navigator.of(context).pop(value);
  }
}

void _onConfirmPressed(BuildContext context, TextEditingController controller) {
  final value = controller.text.trim();
  if (value.isNotEmpty) {
    Navigator.of(context).pop(value);
  }
}

Widget _buildCancelAction(BuildContext context) {
  return PlatformTextButton(
    onPressed: () => Navigator.of(context).pop(),
    child: const Text('Cancel'),
  );
}

Widget _buildConfirmAction(
  BuildContext context,
  TextEditingController controller,
) {
  return PlatformElevatedButton(
    onPressed: () => _onConfirmPressed(context, controller),
    child: const Text('Confirm'),
  );
}
