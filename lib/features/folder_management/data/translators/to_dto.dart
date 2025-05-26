import '../../domain/entities/folder_entity.dart';
import '../../domain/types/folder_type.dart';
import '../dto/folder_dto.dart';
import '../models/folder_model.dart';

extension FolderToDto on Folder {
  FolderDto toDto() {
    return FolderDto(
      id: id,
      name: name,
      parentId: parentFolder.targetId,
      folderType: isPending ? FolderType.pending : FolderType.userApproved,
    );
  }
}

extension FolderEntityToDto on FolderEntity {
  FolderDto toDto() {
    return FolderDto(
      id: id,
      name: name,
      folderType: folderType,
      parentId: parentId,
    );
  }
}
