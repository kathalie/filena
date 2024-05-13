import '../../business/entities/category_entity.dart';
import '../../business/repository_interfaces/category_repository.dart';
import '../data_source_interfaces/category_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  const CategoryRepositoryImpl({
    required this.categoryDataSource,
  });

  @override
  Future<List<CategoryEntity>> getCategories() {
    return categoryDataSource.getCategories();
  }

  @override
  Future<CategoryEntity> getCategory(String categoryId) {
    return categoryDataSource.getCategory(categoryId);
  }
}
