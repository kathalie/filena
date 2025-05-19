import '../../business/repository_interfaces/file_repository.dart';
import '../../domain/entities/file_entity.dart';
import '../../domain/entities/new_file_entity.dart';
import '../../domain/entities/update_file_entity.dart';
import '../datasource/dao/create_file_dao.dart';
import '../datasource/file_datasource.dart';
import '../storage/storage_manager.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDataSource fileDataSource;
  final StorageManager storageManager;

  const FileRepositoryImpl({
    required this.fileDataSource,
    required this.storageManager,
  });

  @override
  Future<FileEntity> getFile(int fileId) async {
    const fileLocalPath = '/tmp';

    final fileDao = await fileDataSource.getFile(fileId);
    await storageManager.retrieveFile(
      fileStoragePath: fileId.toString(),
      fileLocalPath: fileLocalPath,
    );

    return FileEntity(
      id: fileDao.id,
      name: fileDao.name,
      hash: fileDao.hash,
      mimeType: fileDao.mimeType,
      sizeInBytes: fileDao.sizeInBytes,
      timeCreated: fileDao.timeCreated,
      timeLastModified: fileDao.timeLastModified,
      fileLocalPath: fileLocalPath,
    );
  }

  @override
  Future<void> addFile(NewFileEntity newFileEntity, String hash) async {
    final createFileDao = CreateFileDao.fromEntity(newFileEntity, hash);
    final fileId = await fileDataSource.createFile(createFileDao);

    await storageManager.addFile(
      data: newFileEntity.content,
      uniqueFileName: fileId.toString(),
    );
  }

  @override
  Future<void> updateFile(UpdateFileEntity updateFileEntity) async {
    // TODO: implement updateFile
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFile(String fileId) async {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

// Future<FileEntity> _toEntity(File model) async {
//   final allVersionIds = model.allFileVersions.map(
//     (model) => model.id.toString(),
//   );
//
//   final currentFileVersion = model.currentFileVersion.value;
//
//   if (currentFileVersion == null) {
//     throw ArgumentError('File version for requested file does not exist!');
//   }
//
//   final currentFileVersionEntity = await fileVersionRepository.getFileVersion(
//     currentFileVersion.id.toString(),
//   );
//
//   return FileEntity(
//     id: model.id.toString(),
//     name: model.name,
//     timeCreated: model.timeCreated,
//     currentFileVersionId: model.currentFileVersion.value!.id.toString(),
//     allVersionIds: allVersionIds.toList(),
//     location: currentFileVersionEntity.location,
//     content: currentFileVersionEntity.content,
//     sizeInBytes:
//         currentFileVersionEntity.sizeInBytes,
//   );
// }
}
