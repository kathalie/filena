import 'dart:typed_data';

import '../../domain/entities/file_metadata_entity.dart';

abstract interface class StorageManager {
  Future<void> uploadFile({
    required String objectName,
    required Uint8List bytes,
    required FileMetadataEntity metadata,
    void Function(double progress)? onProgress,
  });

  Future<Uint8List> downloadFile({
    required String objectName,
    void Function(double progress)? onProgress,
  });

  Future<void> downloadToFile({
    required String objectName,
    required String savePath,
    void Function(double progress)? onProgress,
  });

  Future<FileMetadataEntity> getFileMetadata({
    required String objectName,
  });

  Future<void> removeFile({
    required String fileStoragePath,
  });

  Future<List<String>> listFileKeys();
}
