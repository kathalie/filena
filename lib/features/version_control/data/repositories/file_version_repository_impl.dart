import '../../business/entities/file_version_entity.dart';
import '../../business/repository_interfaces/file_version_repository.dart';
import '../data_source_interfaces/file_version_data_source.dart';

class FileVersionRepositoryImpl implements FileVersionRepository {
  final FileVersionDataSource fileVersionDataSource;

  const FileVersionRepositoryImpl({
    required this.fileVersionDataSource,
  });

  @override
  Future<void> createFileVersion(FileVersionEntity newFileVersion) {
    return fileVersionDataSource.createFileVersion(newFileVersion);
  }

  @override
  Future<void> deleteFileVersion(String fileVersionId) {
    return deleteFileVersion(fileVersionId);
  }

  @override
  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId) {
    return fileVersionDataSource.getVersionsOfFile(fileId);
  }
}
