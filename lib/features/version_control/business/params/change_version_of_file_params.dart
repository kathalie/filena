class ChangeVersionOfFileParams {
  final String fileId;
  final String newCurrentVersionId;

  const ChangeVersionOfFileParams({
    required this.fileId,
    required this.newCurrentVersionId,
  });
}
