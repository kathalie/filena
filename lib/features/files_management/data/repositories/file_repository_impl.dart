import '../../../../core/errors/file_exception.dart';
import '../../business/repository_interfaces/file_repository.dart';
import '../../domain/entities/file_entity.dart';
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
  Future<FileEntity> getFileDetails(int fileId) async {

    // TODO: implement updateFile
    throw UnimplementedError();

    const fileLocalPath = '/tmp';

    final fileDto = await fileDataSource.getFile(fileId);

    if (fileDto == null) {
      throw FileException.fileDoesNotExist(
        title: 'Failed to find a requested file.',
      );
    }

    await storageManager.retrieveFile(
      fileStoragePath: fileId.toString(),
      fileLocalPath: fileLocalPath,
    );

    // return FileEntity(
    //   id: fileDto.id,
    //   fileDetails: FileDetailsEntity(
    //     name: fileDto.name,
    //     sizeInBytes: fileDto.sizeInBytes,
    //     timeCreated: fileDto.timeCreated,
    //     timeLastModified: fileDto.timeLastModified,
    //     mimeType: fileDto.mimeType,
    //   ),
    //   isFavourite: fileDto.isFavourite,
    // );
  }

  @override
  Future<void> createFile(String filePath) async {
    // TODO: implement updateFile
    throw UnimplementedError();
    // final createFileDao = FileCreateDto.fromEntity(newFileEntity, hash);
    // final fileId = await fileDataSource.createFile(createFileDao);
    //
    // await storageManager.addFile(
    //   data: newFileEntity.content,
    //   uniqueFileName: fileId.toString(),
    // );
  }

  @override
  Future<void> updateFile(updateFileEntity) {
    // TODO: implement updateFile
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFile(int fileId) async {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<void> removeFileFromFolder(int fileId, int folderId) {
    // TODO: implement removeFileFromFolder
    throw UnimplementedError();
  }

  @override
  Future<List<FileEntity>> getFilesInFolder(int folderId) {
    // TODO: implement getFilesInFolder
    throw UnimplementedError();
  }
}
