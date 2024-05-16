import 'package:isar/isar.dart';

import '../../../../core/db/database.dart';
import '../../business/entities/category_entity.dart';
import '../data_source_interfaces/category_data_source.dart';
import '../models/category_model.dart';

class CategoryDao implements CategoryDataSource {
  late Future<Isar> db;

  CategoryDao() {
    db = isarDbConnection();
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final isar = await db;

    final allCategories = await isar.categorys.where().findAll();

    return allCategories.map((categoryModel) {
      return CategoryEntity(
        id: categoryModel.id.toString(),
        name: categoryModel.name,
        extensions: categoryModel.extensions,
        rootCollectionId:
            categoryModel.rootCollection.value?.id.toString() ?? '',
      );
    }).toList();
  }

  @override
  Future<CategoryEntity> getCategory(String categoryId) {
    // TODO: implement getCategory
    throw UnimplementedError();
  }
}
