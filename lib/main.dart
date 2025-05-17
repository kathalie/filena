import 'package:flutter/material.dart';

import 'core/db/objectbox.dart';
import 'core/presentation/app.dart';
import 'features/file_management/data/storage/object_storage_manager.dart';
import 'features/file_management/data/storage/storage_manager.dart';

late ObjectBox objectbox;
late StorageManager minio;

void main() async {
  //TODO Login to MinIO
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();
  minio = await ObjectStorageManager.create();

  runApp(
      const FilenaApp(),
    // const ProviderScope(child: FilenaApp()),
  );
}