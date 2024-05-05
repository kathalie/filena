import '../../../params/category_params.dart';
import '../../domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<CategoryEntity> getCategory({required CategoryParams params});
}