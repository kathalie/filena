import '../../../folder_management/domain/entities/folder_entity.dart';
import '../../../folder_management/domain/types/folder_type.dart';
import '../../domain/entities/folder_suggestion_entity.dart';

class FolderSuggestionPresenter {
  final FolderSuggestionEntity _folderSuggestion;
  final FolderEntity _suggestedFolder;

  FolderSuggestionPresenter(
    FolderSuggestionEntity folderSuggestion,
    FolderEntity suggestedFolder,
  ) : _folderSuggestion = folderSuggestion,
        _suggestedFolder = suggestedFolder;

  int get suggestionId => _folderSuggestion.id;

  String get title {
    return switch (_suggestedFolder.folderType) {
      FolderType.userApproved =>
        'Add ${_folderSuggestion.assignedFileIds.length} files to folder ${_suggestedFolder.name}?',
      FolderType.pending =>
        'Create a folder "${_suggestedFolder.name}" with ${_folderSuggestion.assignedFileIds.length} files?',
    };
  }

  String get message => _folderSuggestion.explanation;

  int get colorHex => _folderSuggestion.colorHex;
}
