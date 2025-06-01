import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../file_management/api/providers.dart';
import '../../../file_management/domain/entities/file_entity.dart';
import '../../../file_management/presentation/change_notifiers/file_repository_changes.dart';
import '../../api/providers.dart';
import '../../domain/entities/folder_entity.dart';
import 'folder_repository_changes.dart';
import 'selected_folder.dart';

final folderPathProvider = FutureProvider<List<FolderEntity>>((ref) async {
  final folderRepo = ref.read(folderRepositoryProvider);
  final selectedFolder = await ref.watch(selectedFolderProvider.future);

  ref.watch(folderChangesProvider);
  ref.watch(fileInFolderChangesProvider);

  return folderRepo.getPathToFolder(selectedFolder.id);
});

final folderPathsProvider = FutureProvider.family<List<FolderEntity>, int>((ref, folderId) async {
  final folderRepo = ref.read(folderRepositoryProvider);

  return await folderRepo.getPathToFolder(folderId);
});

final allFolderPathsProvider = FutureProvider.family<List<List<FolderEntity>>, FileEntity>((ref, fileEntity) async {
  final folderRepo = ref.read(folderRepositoryProvider);
  final fileRepo = ref.read(fileRepositoryProvider);

  final parentFolderIds = await fileRepo.getParentFolderIds(fileEntity.id);

  ref.watch(fileInFolderChangesProvider);

  final paths = await Future.wait(parentFolderIds.map((id) => folderRepo.getPathToFolder(id)));

  return paths;
});