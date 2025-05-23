import 'common/logged_exception.dart';

class FileException extends LoggableException {
  FileException.fileDoesNotExist({
    required super.title,
    super.cause,
  }) : super(
    explanation: 'File does not exist.',
  );
}
