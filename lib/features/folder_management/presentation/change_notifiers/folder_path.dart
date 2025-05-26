import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/entities/folder_entity.dart';
import 'folder_repository_changes.dart';
import 'selected_folder.dart';

final folderPathProvider = FutureProvider<List<FolderEntity>>((ref) async {
  final folderRepo = ref.read(folderRepositoryProvider);
  final selectedFolder = await ref.watch(selectedFolderProvider.future);

  ref.watch(folderChangesProvider);

  return folderRepo.getPathToFolder(selectedFolder.id);
});