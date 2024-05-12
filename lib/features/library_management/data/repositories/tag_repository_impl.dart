import '../../business/entities/tag_entity.dart';
import '../../business/repository_interfaces/tag_repository.dart';

class TagRepositoryImpl implements TagRepository {
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