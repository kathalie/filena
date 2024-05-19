import 'package:isar/isar.dart';

import '../../../../core/db/database.dart';
import '../data_source_interfaces/tag_data_source.dart';
import '../models/tag_model.dart';

class TagDao implements TagDataSource {
  late Future<Isar> db;

  TagDao() {
    db = isarDbConnection();
  }

  @override
  Future<void> createTag({required String name}) {
    // TODO: implement createTag
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTag(String tagId) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<Tag> getTag(String tagId) {
    // TODO: implement getTag
    throw UnimplementedError();
  }

  @override
  Future<List<Tag>> getTags() {
    // TODO: implement getTags
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag({required String id, String? name}) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }
}
