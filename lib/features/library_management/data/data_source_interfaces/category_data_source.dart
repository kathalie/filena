import '../models/category_model.dart';

abstract interface class CategoryDataSource {
  Future<List<Category>> getCategories();
}