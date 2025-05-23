import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/common/errors/llm_exception.dart';
import '../../../../core/common/const.dart';
import 'dto/analysed_user_request_dto.dart';
import 'user_prompt_analysis_client.dart';

class UserPromptAnalysisConst {
  static const filesKeyword = 'files_keyword';
  static const filesKeywordDescription = '''
  A keyword describing the files to be organized.
  ''';

  static const folderSuggestion = 'folder';
  static const folderSuggestionDescription = '''
  The folder where the files should be stored. 
  Use 1 word only.
  ''';

  static const system = '''
      You are a sophisticated file organization assistant.
      Analyze user requests to classify files ($filesKeyword) into folders (folder).
      Output a JSON array.
      '$filesKeyword' describes file types;
      'folder' specifies the destination.
      If no folder is mentioned, suggest the most relevant one-word folder name.
      ''';
}

class OllamaUserPromptAnalysisClient implements FoldersSuggestionDatasource {
  final String baseUrl;

  OllamaUserPromptAnalysisClient({this.baseUrl = ollamaUrl});

  @override
  Future<List<AnalysedUserRequestDto>> analyseUserPrompt(String prompt) async {
    final url = Uri.parse('$baseUrl/api/generate');
    const model = 'llama3.2';

    final payload = {
      'model': model,
      'system': UserPromptAnalysisConst.system,
      'prompt': 'User Request: $prompt',
      'stream': false,
      'format': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            UserPromptAnalysisConst.filesKeyword: {
              'type': 'string',
              'description': UserPromptAnalysisConst.filesKeywordDescription,
            },
            UserPromptAnalysisConst.folderSuggestion: {
              'type': 'string',
              'description': UserPromptAnalysisConst.folderSuggestionDescription,
            },
          },
          'required': [
            UserPromptAnalysisConst.filesKeyword,
            UserPromptAnalysisConst.folderSuggestion,
          ],
        },
      },
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      return _extractFileOrganization(response.body);
    } catch (e) {
      throw LLMException.failedToAnalyseUserPrompt(prompt: prompt, cause: e);
    }
  }

  List<AnalysedUserRequestDto> _extractFileOrganization(String responseBody) {
    final jsonResponse = jsonDecode(responseBody) as Map<String, dynamic>;
    final responseText = jsonResponse['response'] as String;

    final parsedJson = jsonDecode(responseText) as List;

    return parsedJson.map<AnalysedUserRequestDto>((item) {
      final filesKeyword = item[UserPromptAnalysisConst.filesKeyword] as String;
      final folderSuggestion =
          item[UserPromptAnalysisConst.folderSuggestion] as String;

      return AnalysedUserRequestDto(
        filesKeyword: filesKeyword,
        suggestedFolder: folderSuggestion,
      );
    }).toList();
  }
}
