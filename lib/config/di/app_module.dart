import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/config/flavor_config.dart';

import 'package:workspace/features/dashboard/data/data_sources/network/category_api_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Dio> get dio async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: FlavorConfig.instance.values.baseUrlNewsEndpoint,
      ),
    );

    if (!FlavorConfig.isProduction()) {
      dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        responseHeader: true,
        requestBody: true,

        responseBody: true,
        request: true,
        error: true,
      ));
    }
    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> sharedPreferences() async =>
      await SharedPreferences.getInstance();

  @preResolve
  Future<CategoryApiService> categoryApiService(Dio dio) async {
    return CategoryApiService(dio: dio);
  }
}
