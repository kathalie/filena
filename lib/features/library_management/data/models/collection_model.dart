import 'package:isar/isar.dart';

import 'file_model.dart';

part 'collection_model.g.dart';

@collection
class FileCollection {
  Id id = Isar.autoIncrement;

  late String name;

  final childCollections = IsarLinks<FileCollection>();

  final files = IsarLinks<File>();
}
