// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/dashboard/data/data_sources/network/category_api_service.dart'
    as _i3;
import '../../features/dashboard/data/repository/category_repository_impl.dart'
    as _i5;
import '../../features/dashboard/domain/repository/category_repository.dart'
    as _i4;
import '../../features/dashboard/domain/use_cases/get_categories.dart' as _i7;
import '../../features/dashboard/presentation/bloc/remote_category_bloc.dart'
    as _i8;
import 'app_module.dart' as _i9;

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
    gh.factory<_i7.GetCategoriesUseCase>(
        () => _i7.GetCategoriesUseCase(gh<_i4.CategoryRepository>()));
    gh.factory<_i8.RemoteCategoryBloc>(
        () => _i8.RemoteCategoryBloc(gh<_i7.GetCategoriesUseCase>()));
    return this;
  }
}

class _$AppModule extends _i9.AppModule {}
