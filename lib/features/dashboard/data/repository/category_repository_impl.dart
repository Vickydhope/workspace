import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:workspace/core/resources/data_state.dart';
import 'package:workspace/features/dashboard/data/data_sources/network/category_api_service.dart';
import 'package:workspace/features/dashboard/data/model/category.dart';
import 'package:workspace/features/dashboard/domain/repository/category_repository.dart';
import 'package:dio/dio.dart';

@Singleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiService _categoryApiService;

  CategoryRepositoryImpl(this._categoryApiService);

  @override
  Future<DataState<List<CategoryModel>>> getCategories() async {
    try {
      final httpResponse = await _categoryApiService.getCategories();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data?.categories ?? []);
      } else {
        return DataFailed(
          DioException(
              requestOptions: httpResponse.response.requestOptions,
              response: httpResponse.response,
              type: DioExceptionType.badResponse,
              error: httpResponse.response.statusMessage),
        );
      }
    } on DioException catch (e) {
      return DataFailed(DioException(
          requestOptions: e.requestOptions,
          error: e.error,
          message: "No Internet Connection!"));
    }
  }
}
