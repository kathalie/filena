import 'dart:typed_data';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import '../interfaces/storage_manager.dart';

class FileStorageManager implements StorageManager<FilePath> {
  @override
  Future<Uint8List> read(FilePath fileLocation) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> write(Uint8List bytes, FilePath fileLocation) {
    // TODO: implement write
    throw UnimplementedError();
  }

  @override
  Future<void> remove(FilePath fileLocation) {
    // TODO: implement remove
    throw UnimplementedError();
  }
  
}