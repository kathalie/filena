import 'dart:typed_data';

import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import '../../business/entities/file_version_entity.dart';
import '../../business/repository_interfaces/file_version_repository.dart';
import '../interfaces/file_version_data_source.dart';
import '../interfaces/storage_manager.dart';
import '../models/file_version_model.dart';

class FileVersionRepositoryImpl implements FileVersionRepository {
  final FileVersionDataSource fileVersionDataSource;
  final StorageManager<ObjectLocation> storageManager;

  const FileVersionRepositoryImpl({
    required this.fileVersionDataSource,
    required this.storageManager,
  });

  Future<FileVersionEntity> _toEntity(FileVersion model) async {
    final location = ObjectLocation(
      bucket: model.fileLocation,
      objectName: model.fileName,
    );

    // final content = await storageManager.read(location);

    return FileVersionEntity(
      id: model.id.toString(),
      fileId: model.file.value!.id.toString(),
      sizeInBytes: 0,
      // TODO read from storage
      dateEdited: model.dateEdited,
      location: ObjectLocation(
        bucket: model.fileLocation,
        objectName: model.fileName,
      ),
      //TODO read from object storage
      content: Uint8List.fromList([0]),
    );
  }

  @override
  Future<void> createFileVersion({
    required String fileId,
    required int sizeInBytes,
    required DateTime dateEdited,
    required FileLocation location,
    required Uint8List content,
    String? description,
    List<String> tagIds = const [],
    bool isFavourite = false,
  }) async {
    await fileVersionDataSource.createFileVersion(
      fileId: fileId,
      dateEdited: dateEdited,
      location: location,
      description: description,
      isFavourite: isFavourite,
      tagIds: tagIds,
    );
  }

  @override
  Future<void> deleteFileVersion(String fileVersionId) {
    return deleteFileVersion(fileVersionId);
  }

  @override
  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId) async {
    final fileVersions = await fileVersionDataSource.getVersionsOfFile(fileId);

    return await Future.wait(
      fileVersions.map((model) async => await _toEntity(model)).toList(),
    );
  }

  @override
  Future<FileVersionEntity> getFileVersion(String fileVersionId) async {
    final fileVersion =
        await fileVersionDataSource.getFileVersion(fileVersionId);

    return _toEntity(fileVersion);
  }
}
