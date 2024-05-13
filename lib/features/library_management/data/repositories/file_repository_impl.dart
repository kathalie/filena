import '../../business/entities/file_entity.dart';
import '../../business/repository_interfaces/file_repository.dart';
import '../data_source_interfaces/file_data_source.dart';

class FileRepositoryImpl implements FileRepository {
  final FileDataSource fileDataSource;

  const FileRepositoryImpl({
    required this.fileDataSource,
  });

  @override
  Future<void> createFile(FileEntity newFile) {
    return fileDataSource.createFile(newFile);
  }

  @override
  Future<void> deleteFile(String fileId) {
    return fileDataSource.deleteFile(fileId);
  }

  @override
  Future<FileEntity> getFile(String fileId) {
    return fileDataSource.getFile(fileId);
  }

  @override
  Future<List<FileEntity>> getFilesFromCollection(String collectionId) {
    return fileDataSource.getFilesFromCollection(collectionId);
  }

  @override
  Future<FileEntity> updateFile(FileEntity updatedFile) {
    return fileDataSource.updateFile(updatedFile);
  }
}
