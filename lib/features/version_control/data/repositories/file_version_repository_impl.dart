import '../../business/entities/file_version_entity.dart';
import '../../business/repository_interfaces/file_version_repository.dart';

class FileVersionRepositoryImpl implements FileVersionRepository {
  @override
  Future<void> createFileVersion(FileVersionEntity newFileVersion) {
    // TODO: implement createFileVersion
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFileVersion(String fileVersionId) {
    // TODO: implement deleteFileVersion
    throw UnimplementedError();
  }

  @override
  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId) {
    // TODO: implement getVersionsOfFile
    throw UnimplementedError();
  }
  
} 