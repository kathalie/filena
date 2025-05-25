import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../embeddings/api/providers.dart';
import '../data/datasource/datasource_local.dart';
import '../data/datasource/text_embeddings_client_impl.dart';
import '../data/datasource_interfaces/datasource.dart';
import '../data/datasource_interfaces/text_embeddings_client.dart';
import '../data/repositories/repository_impl.dart';
import '../domain/repository_interfaces/repository.dart';

// Data sources
final _folderSuggestionDatasourceProvider = Provider<FolderSuggestionDatasource>((ref) {
  final store = ref.watch(storeProvider);

  return FolderSuggestionDatasourceLocal(store);
});

final _embeddingsClientProvider = Provider<TextEmbeddingsClient>((ref) {
  final embeddingsRepository = ref.watch(embeddingsRepositoryProvider);

  return TextEmbeddingsClientImpl(embeddingsRepository);
});

// Repositories
final folderSuggestionRepositoryProvider = Provider<FolderSuggestionsRepository>((ref) {
  final datasource = ref.watch(_folderSuggestionDatasourceProvider);
  final embeddingsClient = ref.watch(_embeddingsClientProvider);

  return FolderSuggestionsRepositoryImpl(
    folderSuggestionDatasource: datasource,
    embeddingsClient: embeddingsClient,
  );
});
