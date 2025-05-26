import '../../domain/entities/folder_entity.dart';
import '../../domain/types/folder_type.dart';

typedef DirectoryCharacteristics = ({
  String name,
  bool hasNestedFolders,
  bool isRoot,
});

class DirectoryPresenter {
  final FolderEntity folderEntity;
  final bool hasNestedFolders;
  final bool isRoot;
  final String name;

  bool get isPending => folderEntity.folderType == FolderType.pending;

  DirectoryPresenter({
    required this.folderEntity,
    required this.hasNestedFolders,
  })  : isRoot = folderEntity.isRoot,
        name = folderEntity.name;
}
