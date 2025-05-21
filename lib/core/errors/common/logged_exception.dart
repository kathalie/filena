import 'package:flutter/foundation.dart';

abstract class LoggableException implements Exception {
  String title;
  final String? explanation;
  final Object? cause;

  LoggableException({
    required this.title,
    this.explanation,
    this.cause,
  }) {
    log();
  }

  void log() {
    if (kDebugMode) {
      print('''\n
      $title
      ${explanation ?? ""}
      ${cause != null ? '\nCaused by: $cause' : ''}
      \n''');
    }
  }

  @override
  String toString() => '$title: $explanation';
}