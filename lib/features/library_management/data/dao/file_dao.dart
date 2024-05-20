import 'package:isar/isar.dart';

import '../../../../core/db/database.dart';
import '../../../version_control/data/interfaces/file_version_data_source.dart';
import '../../business/entities/supplementary_structures/file_location.dart';
import '../data_source_interfaces/file_data_source.dart';
import '../models/collection_model.dart';
import '../models/file_model.dart';

class FileDao implements FileDataSource {
  late Future<Isar> db;
  final FileVersionDataSource fileVersionDataSource;

  FileDao({
    required this.fileVersionDataSource,
  }) {
    db = isarDbConnection();
  }

  @override
  Future<void> createFile({
    required String parentCollectionId,
    required String name,
    required DateTime dateCreated,
    required String? description,
    required List<String> tagIds,
    required bool isFavourite,
  }) async {
    final isar = await db;

    // TODO location depending on user choice
    final location = ObjectLocation(bucket: 'test_bucket', objectName: name);

    // Get parent collection

    final parentCollection =
        await isar.fileCollections.get(int.parse(parentCollectionId));

    if (parentCollection == null) {
      throw ArgumentError('Collection with required id does not exist!');
    }

    //Create file

    final newFile = File()
      ..name = name
      ..timeCreated = dateCreated
      ..parentCollections.add(parentCollection);

    late final int fileId;

    isar.writeTxnSync(() {
      fileId = isar.files.putSync(newFile);
    });

    //Create fileVersion

    final currentFileVersionId = await fileVersionDataSource.createFileVersion(
      fileId: fileId.toString(),
      dateEdited: newFile.timeCreated,
      location: location,
      description: description,
      tagIds: tagIds,
      isFavourite: isFavourite,
    );

    final newFileVersion = await fileVersionDataSource.getFileVersion(
      currentFileVersionId.toString(),
    );

    isar.writeTxnSync(() {
      newFile.currentFileVersion.value = newFileVersion;
      newFile.currentFileVersion.saveSync();

      newFile.allFileVersions.add(newFileVersion);
      newFile.allFileVersions.saveSync();
    });
  }

  @override
  Future<void> deleteFile(String fileId) {
    // TODO: implement deleteFile
    throw UnimplementedError();
  }

  @override
  Future<File> getFile(String fileId) async {
    final isar = await db;

    final file = await isar.files.get(int.parse(fileId));

    if (file == null) {
      throw ArgumentError('Wrong file id!');
    }

    return file;
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
