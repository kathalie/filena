import 'logged_exception.dart';

class FolderSuggestionException extends LoggableException {
  FolderSuggestionException.folderSuggestionDoesNotExist({
    required super.title,
    super.cause,
  }) : super(
    explanation: 'Folder suggestion does not exist.',
  );
}
