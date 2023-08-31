import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@singleton
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RequestSignin>(_onRequestSignIn);
    on<RequestLoginStatus>(_onRequestLoginStatus);
    on<Logout>(_onLogout);
  }

  FutureOr<void> _onRequestSignIn(
      RequestSignin event, Emitter<AuthState> emit) async {
    emit(Authenticated());
  }

  FutureOr<void> _onRequestLoginStatus(
      RequestLoginStatus event, Emitter<AuthState> emit) {
    emit(false ? Authenticated() : UnAuthenticated());
  }

  FutureOr<void> _onLogout(Logout event, Emitter<AuthState> emit) async {
    emit(UnAuthenticated());
  }
}
