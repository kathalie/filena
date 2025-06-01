import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/folder_management/data/models/folder_model.dart';
import '../../objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {
    _initializeRootFolder();
  }

  void _initializeRootFolder() {
    final folderBox = store.box<Folder>();

    if (!folderBox.isEmpty()) {
      print('Root folder already exists.');

      return;
    }

    final newRootFolder = Folder(
      name: 'All',
      embeddings: [],
    );

    final newFolderId = folderBox.put(newRootFolder);

    print('Root folder created with ID: ${newFolderId}');
  }

  static Future<ObjectBox> create() async {
    final appDir = await getApplicationDocumentsDirectory();
    print(appDir);

    if (!await Directory('${appDir.path}/objectbox-db').exists()) {
      await Directory('${appDir.path}/objectbox-db').create(recursive: true);
    }

    final store =
        await openStore(directory: p.join(appDir.path, 'objectbox-db'));

    return ObjectBox._create(store);
  }
}
