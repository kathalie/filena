import 'folder_dto.dart';

class FolderTreeDto {
  final FolderDto folder;
  final List<FolderTreeDto> nestedFolders;

  const FolderTreeDto({
    required this.folder,
    required this.nestedFolders,
  });
}