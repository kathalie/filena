import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasource/ollama_client.dart';
import '../data/datasource_interfaces/llm_client.dart';
import '../data/repositories/repository_impl.dart';
import '../domain/repository_interfaces/repository.dart';

// Data sources
final _llmClient = Provider<LlmClient>((ref) {
  return OllamaClient();
});

// Repositories
final promptAnalysisRepositoryProvider =
    Provider<PromptAnalysisRepository>((ref) {
  final datasource = ref.watch(_llmClient);

  return PromptAnalysisRepositoryImpl(datasource);
});
