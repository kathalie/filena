import 'dart:typed_data';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';

abstract interface class StorageManager {
  Future<void> write(Uint8List bytes, FileLocation fileLocation);

  Future<Uint8List> read(FileLocation fileLocation);
}