import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/const/const.dart';
import '../../../../core/errors/llm_exception.dart';
import '../datasource_interfaces/llm_client.dart';
import '../dto/analysed_user_request_dto.dart';

class PromptAnalysisConst {
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

class OllamLlmClient implements LlmClient {
  final String baseUrl;

  OllamLlmClient({this.baseUrl = Const.ollamaUrl});

  @override
  Future<List<AnalysedPromptDto>> analyseUserPrompt(String prompt) async {
    final url = Uri.parse('$baseUrl/api/generate');
    const model = 'llama3.2';

    final payload = {
      'model': model,
      'system': PromptAnalysisConst.system,
      'prompt': 'User Request: $prompt',
      'stream': false,
      'format': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            PromptAnalysisConst.filesKeyword: {
              'type': 'string',
              'description': PromptAnalysisConst.filesKeywordDescription,
            },
            PromptAnalysisConst.folderSuggestion: {
              'type': 'string',
              'description':
                  PromptAnalysisConst.folderSuggestionDescription,
            },
          },
          'required': [
            PromptAnalysisConst.filesKeyword,
            PromptAnalysisConst.folderSuggestion,
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

  List<AnalysedPromptDto> _extractFileOrganization(String responseBody) {
    final jsonResponse = jsonDecode(responseBody) as Map<String, dynamic>;
    final responseText = jsonResponse['response'] as String;

    final parsedJson = jsonDecode(responseText) as List;

    return parsedJson.map<AnalysedPromptDto>((item) {
      final filesKeyword = item[PromptAnalysisConst.filesKeyword] as String;
      final folderSuggestion =
          item[PromptAnalysisConst.folderSuggestion] as String;

      return AnalysedPromptDto(
        filesKeyword: filesKeyword,
        suggestedFolder: folderSuggestion,
      );
    }).toList();
  }
}
