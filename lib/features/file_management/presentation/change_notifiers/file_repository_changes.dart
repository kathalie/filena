import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';

final fileChangesProvider = StreamProvider<void>((ref) {
  final fileRepo = ref.watch(fileRepositoryProvider);

  return fileRepo.fileChanges;
});

final fileInFolderChangesProvider = StreamProvider<void>((ref) {
  final fileRepo = ref.watch(fileRepositoryProvider);

  return fileRepo.fileInFolderChanges;
});
