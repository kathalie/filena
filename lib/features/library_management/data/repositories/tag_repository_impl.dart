import '../../business/entities/tag_entity.dart';
import '../../business/repository_interfaces/tag_repository.dart';
import '../data_source_interfaces/tag_data_source.dart';

class TagRepositoryImpl implements TagRepository {
  final TagDataSource tagDataSource;

  const TagRepositoryImpl({
    required this.tagDataSource,
  });

  @override
  Future<void> createTag(TagEntity newTag) {
    return tagDataSource.createTag(newTag);
  }

  @override
  Future<void> deleteTag(String tagId) {
    return tagDataSource.getTag(tagId);
  }

  @override
  Future<TagEntity> getTag(String tagId) {
    return tagDataSource.getTag(tagId);
  }

  @override
  Future<List<TagEntity>> getTags() {
    return tagDataSource.getTags();
  }

  @override
  Future<void> updateTag(TagEntity updatedTag) {
    return tagDataSource.updateTag(updatedTag);
  }
}
