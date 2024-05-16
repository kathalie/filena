import '../../../../core/use_case/use_case.dart';
import '../entities/category_entity.dart';
import '../params/get_categories_params.dart';
import '../repository_interfaces/category_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, GetCategoriesParams> {
  final CategoryRepository categoryRepository;

  const GetCategoriesUseCase({
    required this.categoryRepository,
  });

  @override
  Future<List<CategoryEntity>> call(GetCategoriesParams params) {
    return categoryRepository.getCategories();
  }
}
