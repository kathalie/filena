import '../entities/category_entity.dart';

abstract interface class CategoryRepository {
  Future<CategoryEntity> getCategory(String categoryId);

  Future<List<CategoryEntity>> getCategories();
}
