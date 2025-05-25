// Data sources
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasource/ollama_client.dart';
import '../data/datasource_interfaces/client.dart';
import '../data/repositories/repository_impl.dart';
import '../domain/repository_interfaces/embeddings_repository.dart';

// Data sources
final _embeddingsDatasourceProvider = Provider<EmbeddingsDatasource>((ref) {
  return EmbeddingsClientOllama();
});


// Repositories
final embeddingsRepositoryProvider = Provider<EmbeddingsRepository>((ref) {
  final datasource = ref.watch(_embeddingsDatasourceProvider);

  return EmbeddingsRepositoryImpl(datasource);
});