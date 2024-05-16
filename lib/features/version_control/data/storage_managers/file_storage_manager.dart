import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import 'dart:typed_data';

import '../interfaces/storage_manager.dart';

class FileStorageManager implements StorageManager {
  @override
  Future<Uint8List> read(FileLocation fileLocation) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> write(Uint8List bytes, FileLocation fileLocation) {
    // TODO: implement write
    throw UnimplementedError();
  }
  
}