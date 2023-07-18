import 'package:workspace/core/resources/data_state.dart';
import 'package:workspace/features/dashboard/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> getCategories();
}
