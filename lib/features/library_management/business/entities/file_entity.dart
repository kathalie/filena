class FileEntity {
  final String id;
  final String name;
  final DateTime timeCreated;
  final String currentFileVersionId;

  const FileEntity({
    required this.id,
    required this.name,
    required this.timeCreated,
    required this.currentFileVersionId,
  });
}
   