part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class RequestSignin extends Equatable {
  final String email;
  final String password;

  const RequestSignin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RequestSignUp extends Equatable {
  final String email;
  final String password;

  const RequestSignUp({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
