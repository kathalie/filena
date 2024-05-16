import '../../business/entities/file_version_entity.dart';

abstract interface class FileVersionDataSource {
  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId);

  Future<void> createFileVersion(FileVersionEntity newFileVersion);

  Future<void> deleteFileVersion(String fileVersionId);
}