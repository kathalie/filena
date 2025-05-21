class FolderCreateDto {
  final String name;
  final bool needsConfirmation;
  final int? parentFolderId;

  const FolderCreateDto({
    required this.name,
    required this.needsConfirmation,
    required this.parentFolderId,
  });
}
