import 'package:isar/isar.dart';

import '../../../../core/common/data/db/database.dart';
import '../../business/entities/tag_entity.dart';
import '../data_source_interfaces/tag_data_source.dart';

class TagDao implements TagDataSource {
  late Future<Isar> db;

  TagDao() {
    db = isarDbConnection();
  }

  @override
  Future<void> createTag(TagEntity newTag) {
    // TODO: implement createTag
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTag(String tagId) {
    // TODO: implement deleteTag
    throw UnimplementedError();
  }

  @override
  Future<TagEntity> getTag(String tagId) {
    // TODO: implement getTag
    throw UnimplementedError();
  }

  @override
  Future<List<TagEntity>> getTags() {
    // TODO: implement getTags
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag(TagEntity updatedTag) {
    // TODO: implement updateTag
    throw UnimplementedError();
  }
}
