import 'package:chunked_stream/chunked_stream.dart';
import 'package:minio_new/minio.dart';

import '../../../../core/constants/constants.dart';
import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import 'dart:typed_data';

import '../interfaces/storage_manager.dart';

class ObjectStorageManager implements StorageManager<ObjectLocation> {
  final Minio minio;

  ObjectStorageManager._create()
      : minio = Minio(
          endPoint: 'play.min.io',
          accessKey: 'Q3AM3UQ867SPQQA43P2F',
          secretKey: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG',
        );

  static Future<ObjectStorageManager> create() async {
    final objectStorageManager = ObjectStorageManager._create();

    await objectStorageManager._initializeBuckets();

    return objectStorageManager;
  }

  Future<void> _initializeBuckets() async {
    const defaultBuckets = DefaultBucket.values;

    for (final defaultBucket in defaultBuckets) {
      final bucketExists = await minio.bucketExists(defaultBucket.name);

      if (!bucketExists) {
        await minio.makeBucket(defaultBucket.name);
      }
    }
  }

  @override
  Future<Uint8List> read(ObjectLocation objectLocation) async {
    final object = await minio.getObject(
      objectLocation.bucket,
      objectLocation.objectName,
    );

    return readByteStream(object);
  }

  @override
  Future<void> write(
    Uint8List bytes,
    ObjectLocation objectLocation,
  ) async {
    await minio.putObject(
      objectLocation.bucket,
      objectLocation.objectName,
      Stream.value(bytes),
    );
  }

  @override
  Future<void> remove(ObjectLocation objectLocation) async {
    await minio.removeObject(
      objectLocation.bucket,
      objectLocation.objectName,
    );
  }
}
