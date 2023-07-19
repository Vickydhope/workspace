import 'dart:convert';

import 'package:workspace/features/dashboard/domain/entities/category.dart';

class CategoryResponseModel {
  final List<CategoryModel>? categories;

  const CategoryResponseModel({
    this.categories,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> map) {
    var categories = <CategoryModel>[];
    if (map['categories'] != null) {
      categories = <CategoryModel>[];
      map['categories'].forEach((v) {
        categories.add(CategoryModel.fromJson(v));
      });
    }
    return CategoryResponseModel(categories: categories);
  }
}

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
