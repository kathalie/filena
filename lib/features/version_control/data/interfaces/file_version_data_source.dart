import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import '../models/file_version_model.dart';

abstract interface class FileVersionDataSource {
  Future<FileVersion> getFileVersion(String fileVersionId);

  Future<List<FileVersion>> getVersionsOfFile(String fileId);

  Future<int> createFileVersion({
    required String fileId,
    required DateTime dateEdited,
    required FileLocation location,
    String? description,
    List<String> tagIds = const [],
    bool isFavourite = false,
  });

  Future<void> deleteFileVersion(String fileVersionId);
}
