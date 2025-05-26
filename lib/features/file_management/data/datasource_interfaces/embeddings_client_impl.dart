import '../../../embeddings/domain/repository_interfaces/embeddings_repository.dart';
import '../../common/helpers/file_category.dart';
import '../../common/helpers/fs_file_wrapper.dart';
import '../datasource/embeddings_client.dart';

class EmbeddingsClientImpl implements EmbeddingsClient {
  final EmbeddingsRepository _embeddingsRepository;

  EmbeddingsClientImpl(EmbeddingsRepository embeddingsRepository)
      : _embeddingsRepository = embeddingsRepository;

  @override
  Future<List<double>> getEmbeddings(FsFileWrapper fsFileWrapper) async {
    final fileCategory =
        FileCategory.fromMimeType(await fsFileWrapper.mimeType);

    final List<double> embeddings = switch (fileCategory) {
      FileCategory.document => (await _embeddingsRepository
              .getEmbeddingsForText(await fsFileWrapper.contentAsString))
          .embeddings,
      FileCategory.image => (await _embeddingsRepository
              .getEmbeddingsForImage(await fsFileWrapper.contentAsBase64))
          .embeddings,
      FileCategory.video => <double>[],
      FileCategory.audio => <double>[],
      FileCategory.other => <double>[]
    };

    return embeddings;
  }
}
