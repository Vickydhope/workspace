import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  const CategoryEntity({
    this.idCategory,
    this.strCategory,
    this.strCategoryDescription,
    this.strCategoryThumb,
  });

  @override
  List<Object?> get props => [
        idCategory,
        strCategory,
        strCategoryDescription,
        strCategoryThumb,
      ];
}
