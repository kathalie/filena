import '../entities/tag_entity.dart';

abstract class ITagRepository {
  Future<List<TagEntity>> getTags();
}