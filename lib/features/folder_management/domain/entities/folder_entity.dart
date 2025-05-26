import '../types/folder_type.dart';

class FolderEntity {
  final int id;
  final String name;
  final FolderType folderType;
  final int? parentId;

  FolderEntity({
    required this.id,
    required this.name,
    required this.folderType,
    required this.parentId,
  });

  bool get isRoot => parentId == 0;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FolderEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
