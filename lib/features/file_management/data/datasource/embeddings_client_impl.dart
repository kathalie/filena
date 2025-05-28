import '../../../embeddings/domain/repository_interfaces/embeddings_repository.dart';
import '../../common/helpers/file_category.dart';
import '../../common/helpers/fs_file_wrapper.dart';
import '../datasource_interfaces/embeddings_client.dart';

class EmbeddingsClientImpl implements EmbeddingsClient {
  final EmbeddingsRepository _embeddingsRepository;

  EmbeddingsClientImpl(EmbeddingsRepository embeddingsRepository)
      : _embeddingsRepository = embeddingsRepository;

  @override
  Future<List<double>> generateEmbeddings(String text) async {
    final result = await _embeddingsRepository.generateEmbeddings(text);

    return result.embeddings;
  }
}
