import '../../business/entities/file_entity.dart';
import '../../business/repository_interfaces/file_repository.dart';

class FileRepositoryImpl implements FileRepository {
  @override
  Future<void> createFile(FileEntity newFile) {
    // TODO: implement createFile
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFile(String fileId) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<FileEntity> getFile(String fileId) {
    // TODO: implement getFile
    throw UnimplementedError();
  }

  @override
  Future<List<FileEntity>> getFilesFromCollection(String collectionId) {
    // TODO: implement getFilesFromCollection
    throw UnimplementedError();
  }

  @override
  Future<FileEntity> updateFile(FileEntity updatedFile) {
    // TODO: implement updateFile
    throw UnimplementedError();
  }
  
}