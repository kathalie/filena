import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../objectbox.g.dart';

class ObjectBox {
  /// The Store of this app.
  late final Store store;

  ObjectBox._create(this.store) {
    // Any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final appDir = await getApplicationDocumentsDirectory();
    print(appDir);

    if (!await Directory('${appDir.path}/objectbox-db').exists()) {
      await Directory('${appDir.path}/objectbox-db').create(recursive: true);
    }

    final store = await openStore(directory: p.join(appDir.path, 'objectbox-db'));

    return ObjectBox._create(store);
  }
}