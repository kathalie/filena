class UpdateCollectionParams {
  final String collectionId;
  final String? newName;

  const UpdateCollectionParams({
    required this.collectionId,
    this.newName,
  });
}
