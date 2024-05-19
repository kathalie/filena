import 'package:isar/isar.dart';

import '../../../../core/db/database.dart';
import '../../../version_control/data/models/file_version_model.dart';
import '../../business/entities/supplementary_structures/file_location.dart';
import '../data_source_interfaces/file_data_source.dart';
import '../models/collection_model.dart';
import '../models/file_model.dart';

class FileDao implements FileDataSource {
  late Future<Isar> db;

  FileDao() {
    db = isarDbConnection();
  }

  @override
  Future<void> createFile({
    required String name,
    required DateTime dateCreated,
    required FileLocation location,
    required String? description,
    required List<String> tagIds,
    required bool isFavourite,
  }) async {
    final isar = await db;

    // final currentVersion =
    //     await isar.fileVersions.get(int.parse(currentFileVersionId));
    //
    // if (currentVersion == null) {
    //   throw ArgumentError('Requested current version id does not exist!');
    // }
    //
    // final newFile = File()
    //   ..name = name
    //   ..timeCreated = dateCreated
    //   ..currentFileVersion.value = currentVersion
    //   ..allFileVersions.add(currentVersion);
    //
    // isar.writeTxnSync(() {
    //   isar.files.putSync(newFile);
    // });
  }

  @override
  Future<void> deleteFile(String fileId) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<File> getFile(String fileId) {
    // TODO: implement getFile
    throw UnimplementedError();
  }

  @override
  Future<List<File>> getFilesFromCollection(String collectionId) async {
    final isar = await db;

    final collection = await isar.fileCollections.get(int.parse(collectionId));

    if (collection == null) {
      throw ArgumentError('Wrong collection id!');
    }

    final files = collection.files.toList();

    return files;
  }

  @override
  Future<File> updateFile({
    required String id,
    String? name,
    String? currentFileVersion,
  }) {
    // TODO: implement updateFile
    throw UnimplementedError();
  }
}
