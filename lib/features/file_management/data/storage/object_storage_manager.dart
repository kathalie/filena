import 'dart:typed_data';

import 'package:minio/io.dart';
import 'package:minio/minio.dart';

import 'storage_manager.dart';

class ObjectStorageManager implements StorageManager {
  static const _mainBucketName = 'files';

  //TODO 1. user registration and logic 2. securely store the key
  final Minio _minio = Minio(
    endPoint: 'play.min.io',
    accessKey: 'Q3AM3UQ867SPQQA43P2F',
    secretKey: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG',
  );

  ObjectStorageManager._();

  static Future<ObjectStorageManager> create() async {
    final manager = ObjectStorageManager._();
    await manager._initializeBucket();

    return manager;
  }

  Future<void> _initializeBucket() async {
    final bucketExists = await _minio.bucketExists(_mainBucketName);
    if (!bucketExists) {
      await _minio.makeBucket(_mainBucketName);

      print('Bucket $_mainBucketName created');
    } else {
      print('Bucket $_mainBucketName already exists');
    }
  }

  @override
  Future<void> fAddFile({
    required String fileLocalPath,
    required String uniqueFileName,
  }) async {
    final etag = await _minio.fPutObject(
        _mainBucketName,
        uniqueFileName,
        fileLocalPath,
    );

    print('--- etag: $etag');
  }

  @override
  Future<void> addFile({
    required Stream<Uint8List> data,
    required String uniqueFileName,
  }) async {
    final etag = await _minio.putObject(
      _mainBucketName,
      uniqueFileName,
      data,
    );

    print('--- etag: $etag');
  }

  @override
  Future<void> retrieveFile({
    required String fileStoragePath,
    required String fileLocalPath,
  }) async {
    final copyResult1 = await _minio.copyObject(
        _mainBucketName,
        fileLocalPath,
        fileStoragePath,
    );

    print('--- copy1 etag: ${copyResult1.eTag}');
  }

  @override
  Future<void> removeFile({
    required String fileStoragePath,
  }) async {
    await _minio.removeObject(
        _mainBucketName,
        fileStoragePath,
    );

    print('--- object removed');
  }
}
