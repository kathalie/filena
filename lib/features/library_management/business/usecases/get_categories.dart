import '../entities/category_entity.dart';
import '../repository_interfaces/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository categoryRepository;

  const GetCategoriesUseCase({
    required this.categoryRepository,
  });

  Future<List<CategoryEntity>> call() {
    return categoryRepository.getCategories();
  }
}
