import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/errors/llm_exception.dart';
import '../../const.dart';
import 'embedding_retrieval_client.dart';

class EmbeddingRetrievalConst {
  static const textEmbeddingModel = 'nomic-embed-text';
}

class EmbeddingRetrievalClientOllama implements EmbeddingRetrievalClient {
  final String baseUrl;

  EmbeddingRetrievalClientOllama({this.baseUrl = ollamaUrl});

  @override
  Future<List<double>> getEmbeddingForImage(String imageBase64) async {
    // TODO: implement getEmbeddingForImage
    throw UnimplementedError();
  }

  @override
  Future<List<double>> getEmbeddingForText(String text) async {
    final url = Uri.parse('$baseUrl/api/embed');

    final payload = {
      'model': EmbeddingRetrievalConst.textEmbeddingModel,
      'input': text,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

      return (jsonResponse['embeddings'][0] as List).cast<double>();
    } catch (e) {
      throw LLMException.failedToRetrieveEmbeddings(cause: e);
    }
  }
  
}