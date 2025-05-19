
import '../../../../files_management/data/datasource/dto/file_dto.dart';

class FolderDto {
  final int id;
  final String name;
  final List<FolderDto> nestedFolders;
  final List<FileDto> files;

  const FolderDto({
    required this.id,
    required this.name,
    required this.nestedFolders,
    required this.files,
  });
}
