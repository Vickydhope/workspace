part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}
