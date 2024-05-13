import '../../business/entities/file_version_entity.dart';
import '../data_source_interfaces/file_version_data_source.dart';

class FileVersionDao implements FileVersionDataSource {
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