import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/entities/folder_entity.dart';
import 'folder_repository_changes.dart';
import 'selected_folder.dart';

final folderPathProvider = FutureProvider<List<FolderEntity>>((ref) {
  final folderRepo = ref.watch(folderRepositoryProvider);
  final selectedFolder = ref.watch(selectedFolderProvider);

  ref.watch(folderChangesProvider);

  return folderRepo.getPathToFolder(selectedFolder?.id);
});