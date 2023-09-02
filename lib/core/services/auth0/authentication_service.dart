import 'package:auth0_flutter/auth0_flutter.dart';
/*
const String _auth0ClientId = "t1BWrNJzVmIlcSwlTN2PfL8zkOv0IiNZ";
const String _auth0DomainId = "doops178.us.auth0.com";*/

abstract class AuthenticationService<T> {
  final String _auth0ClientId;

  final String _auth0DomainId;

  AuthenticationService(this._auth0ClientId, this._auth0DomainId);

  Auth0 get auth0 => Auth0(
        _auth0DomainId, //auth0 domain
        _auth0ClientId,
      );

  Future<T> signIn();
  Future<T> getCredentials();

  Future<void> signOut();
}
