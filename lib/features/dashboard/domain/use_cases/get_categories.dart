import 'package:injectable/injectable.dart';
import 'package:workspace/core/resources/data_state.dart';
import 'package:workspace/core/usecase/usecase.dart';
import 'package:workspace/features/dashboard/data/model/category.dart';
import 'package:workspace/features/dashboard/domain/entities/category.dart';
import 'package:workspace/features/dashboard/domain/repository/category_repository.dart';
@injectable
class GetCategoriesUseCase
    implements UseCase<DataState<List<CategoryEntity>>, void> {
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase(this._categoryRepository);

  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) {
    return _categoryRepository.getCategories();
  }
}
