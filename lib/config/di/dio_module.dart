// ignore_for_file: depend_on_referenced_packages

import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../api_config.dart';

@module
abstract class DioModule {
  @preResolve
  @singleton
  Future<Dio> provideDio(BaseOptions baseOptions) async => Dio(baseOptions);

  BaseOptions getBaseOptions(ApiConfig apiConfig) => BaseOptions(
        baseUrl: "${apiConfig.baseUrl}/api/json/v1/1",
      );
}
