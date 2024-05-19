import 'dart:typed_data';

import '../entities/file_entity.dart';
import '../entities/supplementary_structures/file_location.dart';

abstract interface class FileRepository {
  Future<FileEntity> getFile(String fileId);

  Future<List<FileEntity>> getFilesFromCollection(String collectionId);

  Future<void> createFile({
    required String name,
    required DateTime dateCreated,
    required int sizeInBytes,
    required FileLocation location,
    required Uint8List content,
    required String? description,
    required List<String> tagIds,
    required bool isFavourite,
  });

  Future<void> updateFile({
    required String id,
    String? name,
    String? currentFileVersion,
  });

  Future<void> deleteFile(String fileId);
}
