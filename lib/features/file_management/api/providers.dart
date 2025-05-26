import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/providers.dart';
import '../../embeddings/api/providers.dart';
import '../data/datasource/embeddings_client.dart';
import '../data/datasource/datasource_local.dart';
import '../data/datasource_interfaces/datasource.dart';
import '../data/datasource_interfaces/embeddings_client_impl.dart';
import '../data/repositories/repository_impl.dart';
import '../domain/repository_interfaces/file_repository.dart';

// Data sources
final _fileDatasourceProvider = Provider<FileDataSource>((ref) {
  final store = ref.watch(storeProvider);

  return FileDatasourceLocal(store);
});

final _embeddingsClientProvider = Provider<EmbeddingsClient>((ref) {
  final embeddingsRepository = ref.watch(embeddingsRepositoryProvider);

  return EmbeddingsClientImpl(embeddingsRepository);
});

// Repositories
final fileRepositoryProvider = Provider<FileRepository>((ref) {
  final datasource = ref.watch(_fileDatasourceProvider);
  final storageManager = ref.watch(storageManagerProvider);
  final embeddingsClient = ref.watch(_embeddingsClientProvider);

  return FileRepositoryImpl(
    fileDataSource: datasource,
    storageManager: storageManager,
    embeddingsClient: embeddingsClient,
  );
});
