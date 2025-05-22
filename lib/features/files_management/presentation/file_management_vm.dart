import 'package:get_it/get_it.dart';

import '../business/repository_interfaces/folder_repository.dart';
import '../domain/entities/folder_entity.dart';
import '../domain/structures/folder_tree.dart';

class FileManagementViewModel {
  final _folderRepository = GetIt.I.get<FolderRepository>();

  Stream<FolderEntity?> get selectedFolder =>
      _folderRepository.selectedFolder;

  Stream<FolderTreeStructure> get folderStructure =>
      _folderRepository.folderStructure;
}