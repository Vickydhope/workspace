import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

abstract class FirebaseAuthService<T> {
  Future<T> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<T> signUpWithEmailAndPassword(
      {required String email, required String password});

  FutureOr<void> signOut();

  User? get user;
}

@Injectable(as: FirebaseAuthService<User?>)
class FirebaseAuthServiceImpl extends FirebaseAuthService<User?> {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    User? user;

    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return user;
  }

  @override
  User? get user => _firebaseAuth.currentUser;

  @override
  Future signOut() async => await _firebaseAuth.signOut();
}
