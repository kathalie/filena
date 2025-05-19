class CreateFolderDto {
  final String name;
  final bool needsConfirmation;
  final int? parentFolderId;

  const CreateFolderDto({
    required this.name,
    required this.needsConfirmation,
    this.parentFolderId,
  });
}
