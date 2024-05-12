class FileEntity {
  final String id;
  final String name;
  final DateTime dateCreated;
  final String currentFileVersionId;

  const FileEntity({
    required this.id,
    required this.name,
    required this.dateCreated,
    required this.currentFileVersionId,
  });
}
   