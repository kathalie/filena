import '../../business/entities/category_entity.dart';
import '../data_source_interfaces/category_data_source.dart';

class CategoryDao implements CategoryDataSource {
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
