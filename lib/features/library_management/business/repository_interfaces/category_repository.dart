import '../entities/category_entity.dart';

abstract interface class CategoryRepository {
  Future<List<CategoryEntity>> getCategories();
}
