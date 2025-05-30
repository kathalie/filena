import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:minio/minio.dart';

import '../../../../core/errors/minio_exception.dart';
import '../../domain/entities/file_metadata_entity.dart';
import '../datasource_interfaces/storage_manager.dart';

class MinioStorageManager implements StorageManager {
  static const _mainBucketName = 'files';

  //TODO 1. user registration and logic 2. securely store the key
  final Minio _minio = Minio(
    endPoint: 'localhost',
    port: 9000,
    useSSL: false,
    accessKey: 'minioadmin',
    secretKey: 'minioadmin',
  );

  MinioStorageManager._();

  static Future<MinioStorageManager> create() async {
    final manager = MinioStorageManager._();
    await manager.ensureBucketExists();

    return manager;
  }

  Future<void> ensureBucketExists() async {
    try {
      final bucketExists = await _minio.bucketExists(_mainBucketName);
      if (!bucketExists) {
        await _minio.makeBucket(_mainBucketName);

        print('Bucket $_mainBucketName created');
      } else {
        print('Bucket $_mainBucketName already exists');
      }
    } catch (e) {
      print('Filed to ensure bucket exists: $e');
      throw MinioException('Filed to ensure bucket exists.');
    }
  }

  @override
  Future<void> uploadFile({
    required String objectName,
    required Uint8List bytes,
    required FileMetadataEntity metadata,
    void Function(double progress)? onProgress,
  }) async {
    try {
      final metadataMap = metadata.toMetadataMap();

      // metadataMap['X-Amz-Server-Side-Encryption'] = 'AES256';

      final fileSize = bytes.length;

      Stream<Uint8List> byteStream = Stream.value(bytes);

      if (onProgress != null) {
        onProgress(0);
        await _minio.putObject(
          _mainBucketName,
          objectName,
          byteStream,
          size: fileSize,
          metadata: metadataMap,
        );
        onProgress(1.0);

        return;
      }

      await _minio.putObject(
        _mainBucketName,
        objectName,
        byteStream,
        size: fileSize,
        metadata: metadataMap,
      );
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  @override
  Future<Uint8List> downloadFile({
    required String objectName,
    void Function(double progress)? onProgress,
  }) async {
    try {
      final stream = await _minio.getObject(_mainBucketName, objectName);

      final stat = await _minio.statObject(_mainBucketName, objectName);
      final fileSize = stat.size;

      final chunks = <Uint8List>[];
      int downloadedBytes = 0;

      await for (final chunk in stream) {
        chunks.add(Uint8List.fromList(chunk));
        downloadedBytes += chunk.length;

        if (onProgress != null && fileSize != null) {
          onProgress(downloadedBytes / fileSize);
        }
      }

      final result = Uint8List(downloadedBytes);
      int offset = 0;

      for (final chunk in chunks) {
        result.setRange(offset, offset + chunk.length, chunk);
        offset += chunk.length;
      }

      return result;
    } catch (e) {
      throw Exception('Failed to download file: $e');
    }
  }

  @override
  Future<void> downloadToFile({
    required String objectName,
    required String savePath,
    void Function(double progress)? onProgress,
  }) async {
    try {
      final bytes = await downloadFile(
        objectName: objectName,
        onProgress: onProgress,
      );

      await File(savePath).writeAsBytes(bytes);
    } catch (e) {
      throw Exception('Failed to save file: $e');
    }
  }

  @override
  Future<FileMetadataEntity> getFileMetadata({
    required String objectName,
  }) async {
    try {
      final stat = await _minio.statObject(_mainBucketName, objectName);

      final metadataMap = Map<String, String>.fromEntries(
        (stat.metaData ?? {}).entries.map((entry) {
          final key = entry.key.startsWith('x-amz-meta-')
              ? entry.key.substring('x-amz-meta-'.length)
              : entry.key;
          return MapEntry(key, entry.value ?? '');
        }),
      );

      return FileMetadataEntity(
        sizeInBytes: int.tryParse(metadataMap['size-in-bytes'] ?? '')!,
        timeCreated: DateTime.tryParse(metadataMap['time-created'] ?? '')!,
        timeLastModified:
            DateTime.tryParse(metadataMap['time-last-modified'] ?? '')!,
      );
    } catch (e) {
      throw Exception('Failed to get file metadata: $e');
    }
  }

  @override
  Future<void> removeFile({
    required String fileStoragePath,
  }) async {
    await _minio.removeObject(
      _mainBucketName,
      fileStoragePath,
    );
  }
}

extension on FileMetadataEntity {
  Map<String, String> toMetadataMap() {
    return {
      'size-in-bytes': sizeInBytes.toString(),
      'time-created': timeCreated.toIso8601String(),
      'time-last-modified': timeLastModified.toIso8601String(),
    };
  }

  static FileMetadataEntity fromMetadataMap(Map<String, String> metadata) {
    return FileMetadataEntity(
      sizeInBytes: int.tryParse(metadata['size-in-bytes'] ?? '0') ?? 0,
      timeCreated:
          DateTime.tryParse(metadata['time-created'] ?? '') ?? DateTime.now(),
      timeLastModified:
          DateTime.tryParse(metadata['time-last-modified'] ?? '') ??
              DateTime.now(),
    );
  }
}
