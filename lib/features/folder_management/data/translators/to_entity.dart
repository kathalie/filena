import '../../domain/entities/folder_entity.dart';
import '../dto/folder_dto.dart';

extension FolderDtoEntity on FolderDto {
  FolderEntity toEntity() => FolderEntity(
    id: id,
    name: name,
    parentId: parentId,
    folderType: folderType,
  );
}