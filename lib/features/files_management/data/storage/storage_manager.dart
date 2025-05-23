import 'dart:typed_data';

import '../datasource/dto/file_storage_metadata_dto.dart';

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

    Future<FileStorageMetadataDto> retrieveMetadata(String uniqueFileName);
}