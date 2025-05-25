import '../../../folders_management/domain/types/folder_type.dart';
import '../../domain/entities/folder_suggestion_entity.dart';

class SuggestionCardPresenter {
  final FolderSuggestionEntity _folderSuggestion;

  SuggestionCardPresenter(FolderSuggestionEntity folderSuggestion)
      : _folderSuggestion = folderSuggestion;

  int get suggestionId => _folderSuggestion.id;

  int get folderId => _folderSuggestion.suggestedFolder.id;

  String get title {
    return switch (_folderSuggestion.suggestedFolder.folderType) {
      FolderType.userApproved =>
      'Add ${_folderSuggestion.assignedFileIds
          .length} files to folder ${_folderSuggestion.suggestedFolder.name}?',
      FolderType.pending =>
      'Create a folder "${_folderSuggestion.suggestedFolder
          .name}" with ${_folderSuggestion.assignedFileIds.length} files?',
    };
  }

  String get message => _folderSuggestion.explanation;

  int get colorHex => _folderSuggestion.colorHex;
}
