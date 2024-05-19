import '../models/tag_model.dart';

abstract interface class TagDataSource {
  Future<List<Tag>> getTags();

  Future<Tag> getTag(String tagId);

  Future<void> createTag({
    required String name,
  });

  Future<void> updateTag({
    required String id,
    String? name,
  });

  Future<void> deleteTag(String tagId);
}
