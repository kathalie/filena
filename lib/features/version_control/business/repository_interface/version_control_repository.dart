import '../../domain/entities/file_version_entity.dart';

abstract class IVersionControlRepository {
  Future<FileVersionEntity> getFileVersion(String fileVersionId);

  Future<List<FileVersionEntity>> getVersionsOfFile(String fileId);

  Future<void> createFileVersion(FileVersionEntity newFileVersion);

  Future<void> deleteFileVersion(String fileVersionId);
}
