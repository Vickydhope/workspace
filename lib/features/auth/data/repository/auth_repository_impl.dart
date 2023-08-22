import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:workspace/features/auth/data/datasource/firebase_auth_service.dart';
import 'package:workspace/features/auth/domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService<User?> _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<User?> signInWithEmailAndPassword(
          {required String email, required String password}) async =>
      await _authService.signInWithEmailAndPassword(
          email: email, password: password);

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await _authService.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<User?> getUser() async => _authService.user;

  @override
  Future<void> logout() async => await _authService.signOut();
}
