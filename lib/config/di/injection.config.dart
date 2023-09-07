// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth0_flutter/auth0_flutter.dart' as _i7;
import 'package:dio/dio.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../core/preferences/shared_preference_service.dart' as _i14;
import '../../core/services/auth0/authentication_service.dart' as _i6;
import '../../core/services/auth0/authentication_service_impl.dart' as _i8;
import '../../core/services/auth0/credentials/auth_credentials.dart' as _i5;
import '../../features/auth/data/datasource/firebase_auth_service.dart' as _i11;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i16;
import '../../features/auth/domain/repository/auth_repository.dart' as _i15;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i4;
import '../../features/dashboard/data/data_sources/network/category_api_service.dart'
    as _i17;
import '../../features/dashboard/data/repository/category_repository_impl.dart'
    as _i19;
import '../../features/dashboard/domain/repository/category_repository.dart'
    as _i18;
import '../../features/dashboard/domain/use_cases/get_categories.dart' as _i20;
import '../../features/dashboard/presentation/bloc/remote_category_bloc.dart'
    as _i21;
import '../api_config.dart' as _i3;
import '../base_url_config.dart' as _i10;
import 'app_module.dart' as _i22;
import 'dio_module.dart' as _i23;

const String _production = 'production';
const String _development = 'development';
const String _staging = 'staging';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    final appModule = _$AppModule();
    gh.factory<_i3.ApiConfig>(
      () => _i3.ApiConfigDev(),
      registerFor: {_development},
    );
    gh.factory<_i3.ApiConfig>(
      () => _i3.ApiConfigProd(),
      registerFor: {_production},
    );
    gh.factory<_i3.ApiConfig>(
      () => _i3.ApiConfigStg(),
      registerFor: {_staging},
    );
    gh.singleton<_i4.AuthBloc>(_i4.AuthBloc());
    gh.factory<_i5.AuthCredentials>(
      () => _i5.AuthCredentialsProd(),
      registerFor: {_production},
    );
    gh.factory<_i5.AuthCredentials>(
      () => _i5.AuthCredentialsDev(),
      registerFor: {_development},
    );
    gh.factory<_i5.AuthCredentials>(
      () => _i5.AuthCredentialsStaging(),
      registerFor: {_staging},
    );
    gh.factory<_i6.AuthenticationService<_i7.Credentials>>(
        () => _i8.AuthenticationServiceImpl(gh<_i5.AuthCredentials>()));
    gh.factory<_i9.BaseOptions>(
        () => dioModule.getBaseOptions(gh<_i3.ApiConfig>()));
    gh.factory<_i10.BaseUrlConfig>(() => _i10.BaseUrlConfig());
    await gh.singletonAsync<_i9.Dio>(
      () => dioModule.provideDio(gh<_i9.BaseOptions>()),
      preResolve: true,
    );
    gh.factory<_i11.FirebaseAuthService<_i12.User?>>(
        () => _i11.FirebaseAuthServiceImpl());
    await gh.singletonAsync<_i13.SharedPreferences>(
      () => appModule.sharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i14.SharedPreferencesService>(
        () => _i14.SharedPreferencesService(gh<_i13.SharedPreferences>()));
    gh.factory<_i15.AuthRepository>(() =>
        _i16.AuthRepositoryImpl(gh<_i11.FirebaseAuthService<_i12.User?>>()));
    gh.factory<_i17.CategoryApiService>(
        () => _i17.CategoryApiService(dio: gh<_i9.Dio>()));
    gh.singleton<_i18.CategoryRepository>(
        _i19.CategoryRepositoryImpl(gh<_i17.CategoryApiService>()));
    gh.factory<_i20.GetCategoriesUseCase>(
        () => _i20.GetCategoriesUseCase(gh<_i18.CategoryRepository>()));
    gh.factory<_i21.RemoteCategoryBloc>(
        () => _i21.RemoteCategoryBloc(gh<_i20.GetCategoriesUseCase>()));
    return this;
  }
}

class _$AppModule extends _i22.AppModule {}

class _$DioModule extends _i23.DioModule {}
