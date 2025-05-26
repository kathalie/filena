import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/file_management/data/datasource_interfaces/storage_manager.dart';
import '../../objectbox.g.dart';

final storeProvider = Provider<Store>((ref) {
  throw UnimplementedError('Store not initialized');
});

final storageManagerProvider = Provider<StorageManager>((ref) {
  throw UnimplementedError('Storage manager not initialized');
});