import 'dto/analysed_user_request_dto.dart';

abstract interface class FoldersSuggestionDatasource {
  Future<List<AnalysedUserRequestDto>> analyseUserPrompt(String prompt);
}