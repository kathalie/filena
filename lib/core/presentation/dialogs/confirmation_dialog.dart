import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<bool?> showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    ) {
  return showDialog<bool?>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: _DialogTitle(title),
        titlePadding: const EdgeInsets.fromLTRB(24, 16, 16, 8),
        contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        content: Text(message),
        actions: const [
          _CancelAction(),
          _ConfirmAction(),
        ],
      );
    },
  );
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
      onPressed: () => _handleSubmit(false, context),
      child: const Text('Cancel'),
    );
  }
}

class _ConfirmAction extends StatelessWidget {
  const _ConfirmAction();

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: () => _handleSubmit(true, context),
      child: const Text('Confirm'),
    );
  }
}

void _handleSubmit(bool value, BuildContext context) {
  Navigator.of(context).pop(value);
}