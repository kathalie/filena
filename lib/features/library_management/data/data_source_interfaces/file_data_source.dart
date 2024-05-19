import '../../business/entities/supplementary_structures/file_location.dart';
import '../models/file_model.dart';

abstract interface class FileDataSource {
  Future<List<File>> getFilesFromCollection(String collectionId);

  Future<File> getFile(String fileId);

  Future<void> createFile({
    required String name,
    required DateTime dateCreated,
    required FileLocation location,
    required String? description,
    required List<String> tagIds,
    required bool isFavourite,
  });

  Future<File> updateFile({
    required String id,
    String? name,
    String? currentFileVersion,
  });

  Future<void> deleteFile(String fileId);
}
