import 'package:isar/isar.dart';

import 'file_model.dart';

part 'collection_model.g.dart';

@collection
class FilesCollection {
  Id id = Isar.autoIncrement;

  late String name;

  final childCollections = IsarLinks<FilesCollection>();

  // @Backlink(to: 'childCollections')
  // final parentCollection = IsarLink<Collection?>();

  @Backlink(to: 'parentCollection')
  final files = IsarLinks<File>();
}
