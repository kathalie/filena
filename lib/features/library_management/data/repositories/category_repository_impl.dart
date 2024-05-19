import '../../business/entities/category_entity.dart';
import '../../business/repository_interfaces/category_repository.dart';
import '../data_source_interfaces/category_data_source.dart';
import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDataSource categoryDataSource;

  const CategoryRepositoryImpl({
    required this.categoryDataSource,
  });

  CategoryEntity _toEntity(Category categoryModel) {
    final rootCollectionId = categoryModel.rootCollection.value?.id;

    if (rootCollectionId == null) {
      throw ArgumentError('Category does not contain root collection!');
    }

    return CategoryEntity(
      id: categoryModel.id.toString(),
      name: categoryModel.name,
      extensions: categoryModel.extensions,
      rootCollectionId: rootCollectionId.toString(),
    );
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categoryModels = await categoryDataSource.getCategories();

    return categoryModels.map((model) => _toEntity(model)).toList();
  }
}
