import '../../domain/file_entity.dart';
import '../../domain/new_file_entity.dart';
import '../../domain/update_file_entity.dart';

abstract interface class FileRepository {
  Future<FileEntity> getFile(int fileId);
  // Future<List<FileEntity>> getFilesFromCollection(String collectionId);

  Future<void> addFile(NewFileEntity newFileEntity);

  Future<void> updateFile(UpdateFileEntity updateFileEntity);

  Future<void> deleteFile(String fileId);
}
