import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:workspace/config/base_url_config.dart';
import 'package:workspace/features/dashboard/data/model/category.dart';

part 'category_api_service.g.dart';

@RestApi()
abstract class CategoryApiService {
  factory CategoryApiService({required Dio dio}) => _CategoryApiService(dio);

  @GET(BaseUrlConfig.endpointCategories)
  Future<HttpResponse<List<CategoryModel>>> getCategories();
}
