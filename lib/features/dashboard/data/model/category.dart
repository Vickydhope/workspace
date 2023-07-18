import 'package:workspace/features/dashboard/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    String? idCategory,
    String? strCategory,
    String? strCategoryDescription,
    String? strCategoryThumb,
  }) : super(
          idCategory: idCategory,
          strCategory: strCategory,
          strCategoryDescription: strCategoryDescription,
          strCategoryThumb: strCategoryThumb,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      idCategory: map['idCategory'] ?? "",
      strCategory: map['strCategory'] ?? "",
      strCategoryDescription: map['strCategoryDescription'] ?? "",
      strCategoryThumb: map['strCategoryThumb'] ?? "",
    );
  }
}
