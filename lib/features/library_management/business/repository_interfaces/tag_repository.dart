import '../entities/tag_entity.dart';

abstract interface class TagRepository {
  Future<List<TagEntity>> getTags();

  Future<TagEntity> getTag(String tagId);

  Future<void> createTag({
    required String name,
  });

  Future<void> updateTag({
    required String id,
    String? name,
  });

  Future<void> deleteTag(String tagId);
}
