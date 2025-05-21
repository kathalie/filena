abstract interface class EmbeddingRetrievalClient {
  Future<List<double>> getEmbeddingForText(String text);

  Future<List<double>> getEmbeddingForImage(String imageBase64);
}