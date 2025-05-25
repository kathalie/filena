import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';
import '../../domain/types/folder_tree.dart';
import 'folder_repository_changes.dart';

final folderTreeProvider = FutureProvider<FolderTreeStructure>((ref) {
  final folderRepo = ref.watch(folderRepositoryProvider);

  ref.watch(folderChangesProvider);

  return folderRepo.folderStructure;
});
