import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../features/folders_management/data/models/folder_model.dart';
import '../../objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final int rootFolderId;

  ObjectBox._create(this.store) {
    _initializeRootFolder();
  }

  void _initializeRootFolder() {
    final folderBox = store.box<Folder>();

    if (!folderBox.isEmpty()) {
      print("Root folder already exists.");

      return;
    }

    final newRootFolder = Folder(
      name: "Root",
      embeddings: [],
    );

    final newFolderId = folderBox.put(newRootFolder);

    rootFolderId = newFolderId;

    print("Root folder created with ID: ${rootFolderId}");
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
