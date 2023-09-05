// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth0_flutter/auth0_flutter.dart' as _i6;
import 'package:dio/dio.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../core/preferences/shared_preference_service.dart' as _i13;
import '../../core/services/auth0/authentication_service.dart' as _i5;
import '../../core/services/auth0/authentication_service_impl.dart' as _i7;
import '../../core/services/auth0/credentials/auth_credentials.dart' as _i4;
import '../../features/auth/data/datasource/firebase_auth_service.dart' as _i10;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i15;
import '../../features/auth/domain/repository/auth_repository.dart' as _i14;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i3;
import '../../features/dashboard/data/data_sources/network/category_api_service.dart'
    as _i16;
import '../../features/dashboard/data/repository/category_repository_impl.dart'
    as _i18;
import '../../features/dashboard/domain/repository/category_repository.dart'
    as _i17;
import '../../features/dashboard/domain/use_cases/get_categories.dart' as _i19;
import '../../features/dashboard/presentation/bloc/remote_category_bloc.dart'
    as _i20;
import '../base_url_config.dart' as _i8;
import 'app_module.dart' as _i21;

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
    final appModule = _$AppModule();
    gh.singleton<_i3.AuthBloc>(_i3.AuthBloc());
    gh.factory<_i4.AuthCredentials>(
      () => _i4.AuthCredentialsProd(),
      registerFor: {_production},
    );
    gh.factory<_i4.AuthCredentials>(
      () => _i4.AuthCredentialsDev(),
      registerFor: {_development},
    );
    gh.factory<_i4.AuthCredentials>(
      () => _i4.AuthCredentialsStaging(),
      registerFor: {_staging},
    );
    gh.factory<_i5.AuthenticationService<_i6.Credentials>>(
        () => _i7.AuthenticationServiceImpl(gh<_i4.AuthCredentials>()));
    gh.factory<_i8.BaseUrlConfig>(() => _i8.BaseUrlConfig());
    await gh.factoryAsync<_i9.Dio>(
      () => appModule.dio,
      preResolve: true,
    );
    gh.factory<_i10.FirebaseAuthService<_i11.User?>>(
        () => _i10.FirebaseAuthServiceImpl());
    await gh.singletonAsync<_i12.SharedPreferences>(
      () => appModule.sharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i13.SharedPreferencesService>(
        () => _i13.SharedPreferencesService(gh<_i12.SharedPreferences>()));
    gh.factory<_i14.AuthRepository>(() =>
        _i15.AuthRepositoryImpl(gh<_i10.FirebaseAuthService<_i11.User?>>()));
    await gh.factoryAsync<_i16.CategoryApiService>(
      () => appModule.categoryApiService(gh<_i9.Dio>()),
      preResolve: true,
    );
    gh.factory<_i17.CategoryRepository>(
        () => _i18.CategoryRepositoryImpl(gh<_i16.CategoryApiService>()));
    gh.factory<_i19.GetCategoriesUseCase>(
        () => _i19.GetCategoriesUseCase(gh<_i17.CategoryRepository>()));
    gh.factory<_i20.RemoteCategoryBloc>(
        () => _i20.RemoteCategoryBloc(gh<_i19.GetCategoriesUseCase>()));
    return this;
  }
}

class _$AppModule extends _i21.AppModule {}
