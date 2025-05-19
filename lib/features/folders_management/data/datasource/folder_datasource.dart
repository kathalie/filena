import 'dto/create_folder_dto.dart';
import 'dto/folder_dto.dart';

abstract interface class FolderDataSource {
  Future<FolderDto> getFolderHierarchy();

  Future<int> createFolder(CreateFolderDto createFolderDto);

  Future<void> deleteFolder(int folderId);
// Future<File> updateFile({
//   required String id,
//   String? name,
//   String? currentFileVersion,
// });
}
