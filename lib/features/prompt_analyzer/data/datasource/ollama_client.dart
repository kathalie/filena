import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/const/const.dart';
import '../../../../core/errors/llm_exception.dart';
import '../datasource_interfaces/llm_client.dart';
import '../dto/analysed_user_request_dto.dart';

class _PromptAnalysisConst {
  static const filesKeyword = 'files_keyword';
  static const filesKeywordDescription = '''
  A keyword describing the files to be organized.
  ''';

  static const folderSuggestion = 'folder';
  static const folderSuggestionDescription = '''
  The folder where the files should be stored. 
  Use 1 word only.
  ''';

  static const explanation = 'explanation';
  static const explanationDescription = '''
  A brief explanation regarding the decision.
  ''';

  // static const system = '''
  //     You are an accurate file organizing assistant.
  //     1. Identify groups of files which a user wants to organize.
  //     Return an empty array if none are found.
  //     2. For each file group identify a one-word "$filesKeyword" that best describes them.
  //     3. For each file group identify if a user provides a specific folder name.
  //     If no, suggest the most relevant one. The result is a one-word "$folderSuggestion".
  //     4. Output a JSON array, where each element corresponds to a file group.
  //     ''';
  static const system = '''
You are a file organization assistant. Analyze user requests to classify files (files_keyword) into folders (folder). Output a JSON array. 'files_keyword' describes file types; 'folder' specifies the destination. If no folder is mentioned, suggest the most relevant one.
      ''';
  // 5. Provide a brief explanation of your decision "$explanation".

}

class PromptAnalysisOllamaClient implements LlmClient {
  final String baseUrl;

  PromptAnalysisOllamaClient({this.baseUrl = Const.ollamaUrl});

  @override
  Future<List<AnalysedPromptDto>> analyseUserPrompt(String prompt) async {
    print('Analysing prompt: $prompt');

    final url = Uri.parse('$baseUrl/api/generate');
    const model = 'llama3.2';

    final payload = {
      'model': model,
      'system': _PromptAnalysisConst.system,
      'prompt': 'User Request: $prompt',
      'stream': false,
      'format': {
        'type': 'array',
        'items': {
          'type': 'object',
          'properties': {
            _PromptAnalysisConst.filesKeyword: {
              'type': 'string',
              'description': _PromptAnalysisConst.filesKeywordDescription,
            },
            _PromptAnalysisConst.folderSuggestion: {
              'type': 'string',
              'description':
                  _PromptAnalysisConst.folderSuggestionDescription,
            },
            // _PromptAnalysisConst.explanation: {
            //   'type': 'string',
            //   'description':
            //   _PromptAnalysisConst.explanationDescription,
            // },
          },
          'required': [
            _PromptAnalysisConst.filesKeyword,
            _PromptAnalysisConst.folderSuggestion,
            // _PromptAnalysisConst.explanation,
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

      final result = _extractFileOrganization(response.body);

      print('Analysis finished: $result');

      return result;
    } catch (e) {
      throw LLMException.failedToAnalyseUserPrompt(prompt: prompt, cause: e);
    }
  }

  List<AnalysedPromptDto> _extractFileOrganization(String responseBody) {
    final jsonResponse = jsonDecode(responseBody) as Map<String, dynamic>;
    final responseText = jsonResponse['response'] as String;

    final parsedJson = jsonDecode(responseText) as List;
    print(parsedJson);

    return parsedJson.map<AnalysedPromptDto>((item) {
      final filesKeyword = item[_PromptAnalysisConst.filesKeyword] as String;
      final folderSuggestion =
          item[_PromptAnalysisConst.folderSuggestion] as String;
      // final explanation = item[_PromptAnalysisConst.explanation] as String;

      return AnalysedPromptDto(
        filesKeyword: filesKeyword,
        suggestedFolder: folderSuggestion,
        // explanation: explanation,
        explanation: '',
      );
    }).toList();
  }
}
