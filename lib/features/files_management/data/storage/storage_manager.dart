import 'dart:typed_data';

abstract interface class StorageManager {
//   Future<void> write(Uint8List bytes, FL fileLocation);
//
//   Future<Uint8List> read(FL fileLocation);
//
//   Future<void> remove(FL fileLocation);

    Future<void> fAddFile({
        required String fileLocalPath,
        required String uniqueFileName,
    });

    Future<void> addFile({
        required Stream<Uint8List> data,
        required String uniqueFileName,
    });

    Future<void> retrieveFile({
        required String fileStoragePath,
        required String fileLocalPath,
    });

    Future<void> removeFile({
        required String fileStoragePath,
    });
}