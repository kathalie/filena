import 'package:isar/isar.dart';
import 'collection_model.dart';

part 'category_model.g.dart';

@collection
class Category {
  Id id = Isar.autoIncrement;

  late String name;

  late List<String> extensions;

  final rootCollection = IsarLink<FilesCollection>();
}
