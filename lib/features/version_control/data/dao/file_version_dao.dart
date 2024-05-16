import 'package:isar/isar.dart';

import '../../../../core/common/data/db/database.dart';
import '../../business/entities/file_version_entity.dart';
import '../data_source_interfaces/file_version_data_source.dart';

class FileVersionDao implements FileVersionDataSource {
  late Future<Isar> db;

  FileVersionDao() {
    db = isarDbConnection();
  }

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