// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/data/datasource/firebase_auth_service.dart' as _i7;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i12;
import '../../features/auth/domain/repository/auth_repository.dart' as _i11;
import '../../features/dashboard/data/data_sources/network/category_api_service.dart'
    as _i3;
import '../../features/dashboard/data/repository/category_repository_impl.dart'
    as _i5;
import '../../features/dashboard/domain/repository/category_repository.dart'
    as _i4;
import '../../features/dashboard/domain/use_cases/get_categories.dart' as _i9;
import '../../features/dashboard/presentation/bloc/remote_category_bloc.dart'
    as _i10;
import 'app_module.dart' as _i13;

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
    await gh.factoryAsync<_i3.CategoryApiService>(
      () => appModule.categoryApiService,
      preResolve: true,
    );
    gh.factory<_i4.CategoryRepository>(
        () => _i5.CategoryRepositoryImpl(gh<_i3.CategoryApiService>()));
    await gh.factoryAsync<_i6.Dio>(
      () => appModule.dio,
      preResolve: true,
    );
    gh.factory<_i7.FirebaseAuthService<_i8.User?>>(
        () => _i7.FirebaseAuthServiceImpl());
    gh.factory<_i9.GetCategoriesUseCase>(
        () => _i9.GetCategoriesUseCase(gh<_i4.CategoryRepository>()));
    gh.factory<_i10.RemoteCategoryBloc>(
        () => _i10.RemoteCategoryBloc(gh<_i9.GetCategoriesUseCase>()));
    gh.factory<_i11.AuthRepository>(() =>
        _i12.AuthRepositoryImpl(gh<_i7.FirebaseAuthService<_i8.User?>>()));
    return this;
  }
}

class _$AppModule extends _i13.AppModule {}
