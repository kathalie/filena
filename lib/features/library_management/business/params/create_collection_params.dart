import '../entities/collection_entity.dart';

class CreateCollectionParams {
  final CollectionEntity newCollectionEntity;
  final String parentCollectionId;

  const CreateCollectionParams({
    required this.newCollectionEntity,
    required this.parentCollectionId,
  });
}
