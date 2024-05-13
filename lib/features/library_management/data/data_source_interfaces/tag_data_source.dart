import '../../business/entities/tag_entity.dart';

abstract interface class TagDataSource {
  Future<List<TagEntity>> getTags();

  Future<TagEntity> getTag(String tagId);

  Future<void> createTag(TagEntity newTag);

  Future<void> updateTag(TagEntity updatedTag);

  Future<void> deleteTag(String tagId);
}