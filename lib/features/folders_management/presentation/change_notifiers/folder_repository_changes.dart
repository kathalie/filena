import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/providers.dart';

final folderChangesProvider = StreamProvider<void>((ref) {
  final folderRepo = ref.watch(folderRepositoryProvider);

  return folderRepo.folderChanges;
});