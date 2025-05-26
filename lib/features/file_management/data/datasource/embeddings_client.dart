import '../../common/helpers/fs_file_wrapper.dart';

abstract interface class EmbeddingsClient {
  Future<List<double>> getEmbeddings(FsFileWrapper fsFileWrapper);
}