import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/const/const.dart';
import '../../../../core/errors/llm_exception.dart';
import '../datasource_interfaces/client.dart';
import '../dto/processed_file_content_dto.dart';

class _FileProcessingConst {
  static const model = 'llava';

  static const system = '''
  Write a descriptive summary.
  ''';

  static const format = {
    'type': 'object',
    'properties': {
      'summary': {'type': 'string'},
    },
    'required': ['summary'],
  };
}

class FileContentProcessingOllamaClient implements FileContentProcessingClient {
  final String baseUrl;
  late final url = Uri.parse('$baseUrl/api/generate');

  FileContentProcessingOllamaClient({this.baseUrl = Const.ollamaUrl});

  @override
  Future<ProcessedFileContentDto> processImageFileContent(String base64) async {
    final payload = {
      'model': _FileProcessingConst.model,
      'stream': false,
      'format': _FileProcessingConst.format,
      'system': _FileProcessingConst.system,
      'images': [base64],
    };

    final result = await _processFileContent(payload);

    return result;
  }

  @override
  Future<ProcessedFileContentDto> processTextFileContent(String content) async {
    final payload = {
      'model': _FileProcessingConst.model,
      'stream': false,
      'format': _FileProcessingConst.format,
      'system': _FileProcessingConst.system,
      'prompt': content,
    };

    final result = await _processFileContent(payload);

    return result;
  }

  Future<ProcessedFileContentDto> _processFileContent(
    Map<String, dynamic> payload,
  ) async {
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      return ProcessedFileContentDto.fromJson(jsonResponse);
    } catch (e) {
      print(e);
      throw LLMException.failedToProcessFileContent();
    }
  }
}
