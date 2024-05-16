import 'dart:typed_data';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';

abstract interface class StorageManager<FL extends FileLocation> {
  Future<void> write(Uint8List bytes, FL fileLocation);

  Future<Uint8List> read(FL fileLocation);

  Future<void> remove(FL fileLocation);
}