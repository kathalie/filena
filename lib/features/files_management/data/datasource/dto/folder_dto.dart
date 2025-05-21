import '../../models/folder_model.dart';

class FolderDto {
  final int id;
  final String name;
  final int? parentId;

  const FolderDto({
    required this.id,
    required this.name,
    required this.parentId,
  });

  FolderDto.fromModel(Folder model)
      : id = model.id,
        name = model.name,
        parentId = model.parent.targetId;
}
