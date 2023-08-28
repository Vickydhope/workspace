// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../core/preferences/shared_preference_service.dart' as _i13;
import '../../features/auth/data/datasource/firebase_auth_service.dart' as _i8;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i15;
import '../../features/auth/domain/repository/auth_repository.dart' as _i14;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i3;
import '../../features/dashboard/data/data_sources/network/category_api_service.dart'
    as _i4;
import '../../features/dashboard/data/repository/category_repository_impl.dart'
    as _i6;
import '../../features/dashboard/domain/repository/category_repository.dart'
    as _i5;
import '../../features/dashboard/domain/use_cases/get_categories.dart' as _i10;
import '../../features/dashboard/presentation/bloc/remote_category_bloc.dart'
    as _i11;
import 'app_module.dart' as _i16;

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
    await gh.factoryAsync<_i4.CategoryApiService>(
      () => appModule.categoryApiService,
      preResolve: true,
    );
    gh.factory<_i5.CategoryRepository>(
        () => _i6.CategoryRepositoryImpl(gh<_i4.CategoryApiService>()));
    await gh.factoryAsync<_i7.Dio>(
      () => appModule.dio,
      preResolve: true,
    );
    gh.factory<_i8.FirebaseAuthService<_i9.User?>>(
        () => _i8.FirebaseAuthServiceImpl());
    gh.factory<_i10.GetCategoriesUseCase>(
        () => _i10.GetCategoriesUseCase(gh<_i5.CategoryRepository>()));
    gh.factory<_i11.RemoteCategoryBloc>(
        () => _i11.RemoteCategoryBloc(gh<_i10.GetCategoriesUseCase>()));
    await gh.singletonAsync<_i12.SharedPreferences>(
      () => appModule.sharedPreferences(),
      preResolve: true,
    );
    gh.factory<_i13.SharedPreferencesService>(
        () => _i13.SharedPreferencesService(gh<_i12.SharedPreferences>()));
    gh.factory<_i14.AuthRepository>(() =>
        _i15.AuthRepositoryImpl(gh<_i8.FirebaseAuthService<_i9.User?>>()));
    return this;
  }
}

class _$AppModule extends _i16.AppModule {}
