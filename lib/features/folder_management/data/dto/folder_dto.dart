import '../../domain/types/folder_type.dart';

class FolderDto {
  final int id;
  final String name;
  final int? parentId;
  final FolderType folderType;

  const FolderDto({
    required this.id,
    required this.name,
    required this.folderType,
    required this.parentId,
  });
}
