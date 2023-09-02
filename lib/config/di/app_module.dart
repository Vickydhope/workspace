import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workspace/config/base_url_config.dart';
import 'package:workspace/config/flavor_config.dart';
import 'package:workspace/config/di/injection.dart';
import 'package:workspace/core/services/auth0/authentication_with_social_connections.dart';
import 'package:workspace/core/services/auth0/connections/sign_in_with_google.dart';
import 'package:workspace/features/dashboard/data/data_sources/network/category_api_service.dart';

@module
abstract class AppModule {
  @preResolve
  Future<Dio> get dio async => Dio(
        BaseOptions(baseUrl: FlavorConfig.instance.values.baseUrlNewsEndpoint),
      );

  @preResolve
  @singleton
  Future<SharedPreferences> sharedPreferences() async =>
      await SharedPreferences.getInstance();

  @preResolve
  Future<CategoryApiService> get categoryApiService async {
    final dio = await this.dio;

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

    return CategoryApiService(dio: dio);
  }

  @production
  AuthenticationWithSocialConnections authSignInAuth0Prod() {
    final baseUrlConfig = getIt<BaseUrlConfig>();
    return AuthenticationWithSocialConnections(
      auth0DomainId: baseUrlConfig.auth0DomainProd,
      auth0ClientId: getIt<BaseUrlConfig>().auth0ClientIdProd,
    );
  }

  @development
  AuthenticationWithSocialConnections authSignInAuth0Dev() {
    final baseUrlConfig = getIt<BaseUrlConfig>();

    print(baseUrlConfig.auth0ClientIdDev);
    return AuthenticationWithSocialConnections(
      auth0DomainId: baseUrlConfig.auth0DomainDev,
      auth0ClientId: getIt<BaseUrlConfig>().auth0ClientIdDev,
    );
  }

  @staging
  AuthenticationWithSocialConnections authSignInAuth0Stg() {
    final baseUrlConfig = getIt<BaseUrlConfig>();
    return AuthenticationWithSocialConnections(
      auth0DomainId: baseUrlConfig.auth0DomainStg,
      auth0ClientId: getIt<BaseUrlConfig>().auth0ClientIdStg,
    );
  }
}
