import 'dart:typed_data';

import '../../../version_control/business/repository_interfaces/file_version_repository.dart';
import '../../business/entities/file_entity.dart';
import '../../business/repository_interfaces/file_repository.dart';
import '../data_source_interfaces/file_data_source.dart';
import '../models/file_model.dart';

class FileRepositoryImpl implements FileRepository {
  final FileVersionRepository fileVersionRepository;
  final FileDataSource fileDataSource;

  const FileRepositoryImpl({
    required this.fileVersionRepository,
    required this.fileDataSource,
  });

  Future<FileEntity> _toEntity(File model) async {
    final allVersionIds = model.allFileVersions.map(
      (model) => model.id.toString(),
    );

    final currentFileVersion = model.currentFileVersion.value;

    if (currentFileVersion == null) {
      throw ArgumentError('File version for requested file does not exist!');
    }

    final currentFileVersionEntity = await fileVersionRepository.getFileVersion(
      currentFileVersion.id.toString(),
    );

    return FileEntity(
      id: model.id.toString(),
      name: model.name,
      timeCreated: model.timeCreated,
      currentFileVersionId: model.currentFileVersion.value!.id.toString(),
      allVersionIds: allVersionIds.toList(),
      location: currentFileVersionEntity.location,
      content: currentFileVersionEntity.content,
      sizeInBytes:
          currentFileVersionEntity.sizeInBytes,
    );
  }

  @override
  Future<void> createFile({
    required String parentCollectionId,
    required String categoryName,
    required String name,
    required DateTime dateCreated,
    required int sizeInBytes,
    required Uint8List content,
    required String? description,
    required List<String> tagIds,
    required bool isFavourite,
  }) async {
    await fileDataSource.createFile(
      parentCollectionId: parentCollectionId,
      categoryName: categoryName,
      name: name,
      dateCreated: dateCreated,
      description: description,
      tagIds: tagIds,
      isFavourite: isFavourite,
    );
  }

  @override
  Future<void> deleteFile(String fileId) {
    return fileDataSource.deleteFile(fileId);
  }

  @override
  Future<FileEntity> getFile(String fileId) async {
    final file = await fileDataSource.getFile(fileId);

    return _toEntity(file);
  }

  @override
  Future<List<FileEntity>> getFilesFromCollection(String collectionId) async {
    final files = await fileDataSource.getFilesFromCollection(collectionId);

    return await Future.wait(files.map((model) => _toEntity(model)).toList());
  }

  @override
  Future<void> updateFile({
    required String id,
    String? name,
    String? currentFileVersion,
  }) async {
    await fileDataSource.updateFile(
      id: id,
      name: name,
      currentFileVersion: currentFileVersion,
    );
  }
}
