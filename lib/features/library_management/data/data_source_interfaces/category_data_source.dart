import '../../business/entities/category_entity.dart';

abstract interface class CategoryDataSource {
  Future<List<CategoryEntity>> getCategories();

  Future<CategoryEntity> getCategory(String categoryId);
}