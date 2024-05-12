import '../entities/tag_entity.dart';

abstract interface class TagRepository {
  Future<List<TagEntity>> getTags();

  Future<void> createTag(TagEntity newTag);

  Future<void> updateTag(TagEntity updatedTag);

  Future<void> deleteTag(String tagId);
}
