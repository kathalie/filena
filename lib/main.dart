import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/api/providers.dart';
import 'core/db/objectbox.dart';
import 'core/presentation/app/app.dart';
import 'core/presentation/app/loading_app.dart';
import 'features/file_management/data/datasource/object_storage_manager.dart';

void main() async {
  //TODO register an login to minio
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const LoadingApp());

  final objectBox = await ObjectBox.create();
  final storageManager = await MinioStorageManager.create();

  runApp(
    ProviderScope(
      overrides: [
        storeProvider.overrideWithValue(objectBox.store),
        // rootFolderIdProvider.overrideWithValue(objectBox.rootFolderId),
        storageManagerProvider.overrideWithValue(storageManager),
      ],
      child: const FilenaApp(),
    ),
  );
}
