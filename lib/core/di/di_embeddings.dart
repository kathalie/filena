import 'package:get_it/get_it.dart';

import '../../features/embeddings/business/repository_interfaces/embeddings_repository.dart';
import '../../features/embeddings/data/datasource/embeddings_datasource.dart';
import '../../features/embeddings/data/datasource/embeddings_client_ollama.dart';
import '../../features/embeddings/data/repositories/embeddings_repository_impl.dart';

void setupEmbeddingsDi() async {
  // Data sources
  GetIt.I.registerSingleton<EmbeddingsDatasource>(
    EmbeddingsClientOllama(),
  );

  // Repositories
  GetIt.I.registerSingleton<EmbeddingsRepository>(
    EmbeddingsRepositoryImpl(
      GetIt.I.get<EmbeddingsDatasource>(),
    ),
  );
}
