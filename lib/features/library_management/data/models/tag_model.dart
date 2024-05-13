import 'package:isar/isar.dart';

import '../../../version_control/data/models/file_version_model.dart';

part 'tag_model.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  late String name;

  @Backlink(to: 'tags')
  final fileVersions = IsarLinks<FileVersion>();
}
