import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:workspace/core/resources/data_state.dart';
import 'package:dio/dio.dart';
import 'package:workspace/features/dashboard/domain/use_cases/get_categories.dart';

import '../../domain/entities/category.dart';

part 'remote_category_event.dart';

part 'remote_category_state.dart';

@injectable
class RemoteCategoryBloc
    extends Bloc<RemoteCategoryEvent, RemoteCategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;

  RemoteCategoryBloc(
    this._getCategoriesUseCase,
  ) : super(const RemoteCategoriesLoading()) {
    on<GetCategories>(onGetCategories);
  }

  FutureOr<void> onGetCategories(
      GetCategories event, Emitter<RemoteCategoryState> emit) async {
    emit(const RemoteCategoriesLoading());
    await Future.delayed(const Duration(seconds: 2));
    final dataState = await _getCategoriesUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteCategoriesDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteCategoriesError(dataState.error!));
    }
  }
}
