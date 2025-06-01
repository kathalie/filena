import 'package:flutter/material.dart';

class SnackbarUtil {
  static void show({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        action: action,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(8),
      ),
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    VoidCallback? onRetry,
  }) {
    show(
      context: context,
      message: message,
      backgroundColor: Colors.red.shade700,
      duration: const Duration(seconds: 5),
      action: onRetry != null ? SnackBarAction(
        label: 'RETRY',
        textColor: Colors.white,
        onPressed: onRetry,
      ) : null,
    );
  }

  static void showSuccess({
    required BuildContext context,
    required String message,
  }) {
    show(
      context: context,
      message: message,
      backgroundColor: Colors.green.shade600,
      duration: const Duration(seconds: 2),
    );
  }
}