import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/datasource/ollama_client.dart';
import '../data/datasource_interfaces/client.dart';
import '../data/repositories/repository_impl.dart';
import '../domain/repository_interfaces/repository.dart';

final _fileProcessingClientProvider = Provider<FileContentProcessingClient>((ref) {
  return FileContentProcessingOllamaClient();
});


// Repositories
final fileContentProcessingRepositoryProvider = Provider<FileContentProcessingRepository>((ref) {
  final datasource = ref.watch(_fileProcessingClientProvider);

  return FileContentProcessingRepositoryImpl(datasource);
});