part of 'remote_category_bloc.dart';

@immutable
abstract class RemoteCategoryEvent {
  const RemoteCategoryEvent();
}

class GetCategories extends RemoteCategoryEvent {}
