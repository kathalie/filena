import '../entities/file_version_entity.dart';

abstract class IFileVersionRepository {
  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId);

  Future<void> createFileVersion(FileVersionEntity newFileVersion);

  Future<void> deleteFileVersion(String fileVersionId);
}
