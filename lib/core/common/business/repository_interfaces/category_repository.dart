import '../entities/category_entity.dart';

abstract class ICategoryRepository {
  Future<CategoryEntity> getCategory(String categoryId);

  Future<List<CategoryEntity>> getCategories();
}
