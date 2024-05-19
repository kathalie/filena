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
  Future<List<Category>> getCategories() async {
    final isar = await db;

    final allCategories = await isar.categorys.where().findAll();

    return allCategories;
  }
}
