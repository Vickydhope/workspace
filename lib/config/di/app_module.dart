import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/config/flavor_config.dart';
import 'package:workspace/config/di/injection.dart';
import 'package:workspace/features/dashboard/data/data_sources/network/category_api_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Dio> get dio async => Dio(BaseOptions(
        baseUrl: FlavorConfig.instance.values.baseUrlNewsEndpoint,
      ));


  @preResolve
  @singleton
  Future<SharedPreferences> sharedPreferences()async=> await SharedPreferences.getInstance();

  @preResolve
  Future<CategoryApiService> get categoryApiService async {
    final _dio = await dio;

    if (!FlavorConfig.isProduction()) {
      _dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,
        responseBody: true,
        request: true,
        error: true,
      ));
    }

    return CategoryApiService(dio: _dio);
  }
}
