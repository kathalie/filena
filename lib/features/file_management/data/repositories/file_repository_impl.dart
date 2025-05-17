import '../../business/repository_interfaces/file_repository.dart';
import '../../domain/file_entity.dart';
import '../../domain/new_file_entity.dart';
import '../../domain/update_file_entity.dart';
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
    // TODO: implement getFile
    throw UnimplementedError();
  }

  @override
  Future<void> addFile(NewFileEntity newFileEntity) async {
    // TODO: implement getFile
    throw UnimplementedError();  }

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