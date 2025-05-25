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
        title: _DialogTitle(title),
        titlePadding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        content: _DialogInputField(controller, inputHint),
        actions: [
          const _CancelAction(),
          _ConfirmAction(controller),
        ],
      );
    },
  );
}

class _DialogInputField extends StatelessWidget {
  final TextEditingController _controller;
  final String hint;

  const _DialogInputField(this._controller, this.hint);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      onSubmitted: (value) => _handleSubmit(value, context),
    );
  }
}

class _DialogTitle extends StatelessWidget {
  final String title;

  const _DialogTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _CancelAction extends StatelessWidget {
  const _CancelAction();

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: const Text('Cancel'),
    );
  }
}

class _ConfirmAction extends StatelessWidget {
  final TextEditingController _controller;

  const _ConfirmAction(this._controller);

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: () => _handleSubmit(_controller.text, context),
      child: const Text('Confirm'),
    );
  }
}

void _handleSubmit(String value, BuildContext context) {
  if (value.trim().isNotEmpty) {
    Navigator.of(context).pop(value);
  }
}