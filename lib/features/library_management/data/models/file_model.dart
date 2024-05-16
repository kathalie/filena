import 'package:isar/isar.dart';

import '../../../version_control/data/models/file_version_model.dart';
import 'collection_model.dart';

part 'file_model.g.dart';

@collection
class File {
  Id id = Isar.autoIncrement;

  late String name;

  late DateTime timeCreated;

  final currentFileVersion = IsarLink<FileVersion>();

  @Backlink(to: 'file')
  final allFileVersions = IsarLinks<FileVersion>();

  @Backlink(to: 'files')
  final parentCollections = IsarLinks<FilesCollection>();
}
