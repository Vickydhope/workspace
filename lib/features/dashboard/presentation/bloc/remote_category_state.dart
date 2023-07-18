part of 'remote_category_bloc.dart';

@immutable
abstract class RemoteCategoryState extends Equatable {
  final List<CategoryEntity>? categories;
  final DioException? error;

  const RemoteCategoryState({
    this.categories,
    this.error,
  });

  @override
  List<Object?> get props => [
        categories,
        error,
      ];
}

class RemoteCategoriesLoading extends RemoteCategoryState {
  const RemoteCategoriesLoading();
}

class RemoteCategoriesDone extends RemoteCategoryState {
  const RemoteCategoriesDone(List<CategoryEntity> categories)
      : super(categories: categories);
}

class RemoteCategoriesError extends RemoteCategoryState {
  const RemoteCategoriesError(DioException? error) : super(error: error);
}
