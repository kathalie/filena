
import '../../../files_management/domain/entities/file_entity.dart';

enum FolderType {
  regular, generationSuggestion, assignmentSuggestion
}

class FolderEntity {
  final int id;
  final String name;
  final FolderType type;

  final List<FolderEntity> nestedFolders;
  final List<FileEntity> files;

  FolderEntity({
    required this.id,
    required this.name,
    required this.nestedFolders,
    required this.files,
    this.type = FolderType.regular,
  });
}