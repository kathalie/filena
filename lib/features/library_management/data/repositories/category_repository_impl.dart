import '../../business/entities/category_entity.dart';
import '../../business/repository_interfaces/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<List<CategoryEntity>> getCategories() {
    // TODO: implement getCategories
    throw UnimplementedError();
  }

  @override
  Future<CategoryEntity> getCategory(String categoryId) {
    // TODO: implement getCategory
    throw UnimplementedError();
  }

}