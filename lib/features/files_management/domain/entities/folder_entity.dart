class FolderEntity {
  final int id;
  final String name;
  final int? parentId;

  FolderEntity({
    required this.id,
    required this.name,
    required this.parentId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FolderEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
