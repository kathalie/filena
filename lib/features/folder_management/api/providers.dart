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
final _folderDatasourceProvider = Provider<FolderDataSource>((ref) {
  final store = ref.watch(storeProvider);

  return FolderDatasourceLocal(store);
});

final _embeddingsClientProvider = Provider<TextEmbeddingsClient>((ref) {
  final embeddingsRepository = ref.watch(embeddingsRepositoryProvider);

  return TextEmbeddingsClientImpl(embeddingsRepository);
});

// Repositories
final folderRepositoryProvider = Provider<FolderRepository>((ref) {
  final datasource = ref.watch(_folderDatasourceProvider);
  final embeddingsClient = ref.watch(_embeddingsClientProvider);

  return FolderRepositoryImpl(
    folderDataSource: datasource,
    embeddingsClient: embeddingsClient,
  );
});
