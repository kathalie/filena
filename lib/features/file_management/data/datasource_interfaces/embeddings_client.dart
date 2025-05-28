abstract interface class EmbeddingsClient {
  Future<List<double>> generateEmbeddings(String text);
}