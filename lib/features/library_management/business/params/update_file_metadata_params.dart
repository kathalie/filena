class UpdateFileMetadataParams {
  final String fileId;
  final List<String>? newTagIds;
  final String? description;
  final bool? isFavourite;

  const UpdateFileMetadataParams({
    required this.fileId,
    this.newTagIds,
    this.description,
    this.isFavourite,
  });
}
