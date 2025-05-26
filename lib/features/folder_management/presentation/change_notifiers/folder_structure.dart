import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/types/folder_tree.dart';
import 'folder_repository_changes.dart';

final folderTreeProvider = FutureProvider<FolderTree>((ref) {
  final folderRepo = ref.read(folderRepositoryProvider);

  ref.watch(folderChangesProvider);

  return folderRepo.folderStructure;
});
