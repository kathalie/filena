import 'common/logged_exception.dart';

class FolderException extends LoggableException {
  FolderException.folderDoesNotExist({
    required super.title,
    super.cause,
  }) : super(
    explanation: 'Folder does not exist.',
  );

  FolderException.failedToRenameFolder({
    super.explanation,
    super.cause,
  }) : super(
          title: 'Failed rename a folder',
        );

  FolderException.failedToCreateFolder({
    required String folderName,
    super.explanation,
    super.cause,
  }) : super(
          title: 'Failed to create folder "$folderName"',
        );

  FolderException.failedToDeleteFolder({
    required String folderName,
    super.explanation,
    super.cause,
  }) : super(
          title: 'Failed to delete folder "$folderName"',
        );
}
