import 'package:auth0_flutter/auth0_flutter.dart';

const String _auth0ClientId = "t1BWrNJzVmIlcSwlTN2PfL8zkOv0IiNZ";
const String _auth0DomainId = "doops178.us.auth0.com";

abstract class AuthenticationService<T> {
  Auth0 auth0 = Auth0(
    _auth0DomainId, //auth0 domain
    _auth0ClientId,
  );

  Future<T> signIn();

  Future<void> signOut();
}
