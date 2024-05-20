import 'package:isar/isar.dart';

import '../../../../core/db/database.dart';
import '../../../library_management/business/entities/supplementary_structures/file_location.dart';
import '../../../library_management/data/models/file_model.dart';
import '../../../library_management/data/models/tag_model.dart';
import '../interfaces/file_version_data_source.dart';
import '../models/file_version_model.dart';

class FileVersionDao implements FileVersionDataSource {
  late Future<Isar> db;

  FileVersionDao() {
    db = isarDbConnection();
  }

  @override
  Future<int> createFileVersion({
    required String fileId,
    required DateTime dateEdited,
    required FileLocation location,
    String? description,
    List<String> tagIds = const [],
    bool isFavourite = false,
  }) async {
    final isar = await db;

    final file = await isar.files.get(int.parse(fileId));

    if (file == null) {
      throw ArgumentError('Trying to crate file version for nonexistent file!');
    }

    final tags = await Future.wait(
      tagIds
          .map(
            (tagId) => isar.tags.get(int.parse(tagId)),
          )
          .toList(),
    );

    final List<Tag> tagModels = [];
    for (final tag in tags) {
      if (tag == null) {
        throw ArgumentError(
            'Trying to create file version with nonexistent tag!');
      }

      tagModels.add(tag);
    }

    final (fileLocation, fileName) = switch (location) {
      FilePath(fileName: final fileName, link: final link) => (link, fileName),
      ObjectLocation(bucket: final bucket, objectName: final name) => (
          bucket,
          name
        ),
    };

    final fileVersion = FileVersion()
      ..dateEdited = dateEdited
      ..fileName = fileName
      ..fileLocation = fileLocation
      ..description = description
      ..isFavourite = isFavourite
      ..file.value = file
      ..tags.addAll(tagModels);

    late final int newFileId;

    isar.writeTxnSync(() {
      newFileId = isar.fileVersions.putSync(fileVersion);
    });

    return newFileId;
  }

  @override
  Future<void> deleteFileVersion(String fileVersionId) {
    // TODO: implement deleteFileVersion
    throw UnimplementedError();
  }

  @override
  Future<FileVersion> getFileVersion(String fileVersionId) async {
    final isar = await db;

    final fileVersion = await isar.fileVersions.get(int.parse(fileVersionId));

    if (fileVersion == null) {
      throw ArgumentError('Wrong file version id!');
    }

    return fileVersion;
  }

  @override
  Future<List<FileVersion>> getVersionsOfFile(String fileId) async {
    final isar = await db;

    final file = await  isar.files.get(int.parse(fileId));

    if (file == null) {
      throw ArgumentError('Wrong file id!');
    }

    final fileVersions = file.allFileVersions.toList();

    return fileVersions;
  }
}
