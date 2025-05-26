abstract interface class TextEmbeddingsClient {
  Future<List<double>> getEmbeddings(String text);
}