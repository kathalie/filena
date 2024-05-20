import '../../business/entities/tag_entity.dart';
import '../../business/repository_interfaces/tag_repository.dart';
import '../data_source_interfaces/tag_data_source.dart';
import '../models/tag_model.dart';

class TagRepositoryImpl implements TagRepository {
  final TagDataSource tagDataSource;

  const TagRepositoryImpl({
    required this.tagDataSource,
  });

  TagEntity _toEntity(Tag model) {
    return TagEntity(
      id: model.id.toString(),
      name: model.name,
    );
  }

  @override
  Future<void> createTag({required String name}) async {
    await tagDataSource.createTag(name: name);
  }

  @override
  Future<void> deleteTag(String tagId) {
    return tagDataSource.getTag(tagId);
  }

  @override
  Future<TagEntity> getTag(String tagId) async {
    final tagModel = await tagDataSource.getTag(tagId);

    return _toEntity(tagModel);
  }

  @override
  Future<List<TagEntity>> getTags() async {
    final tagModels = await tagDataSource.getTags();

    return tagModels.map((model) => _toEntity(model)).toList();
  }

  @override
  Future<void> updateTag({required String id, String? name}) async {
    await tagDataSource.updateTag(
      id: id,
      name: name,
    );
  }
}
