import 'dart:typed_data';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import '../entities/file_version_entity.dart';

abstract interface class FileVersionRepository {
  Future<FileVersionEntity> getFileVersion(String fileVersionId);

  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId);

  Future<void> createFileVersion({
    required String fileId,
    required int sizeInBytes,
    required DateTime dateEdited,
    required FileLocation location,
    required Uint8List content,
    String? description,
    List<String> tagIds = const [],
    bool isFavourite = false,
  });

  Future<void> deleteFileVersion(String fileVersionId);
}
