import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:workspace/core/services/auth0/credentials/auth_credentials.dart';

import 'authentication_service.dart';

enum SocialConnection {
  apple('apple'),
  google('google-oauth2');

  final String getName;

  const SocialConnection(this.getName);
}

@Injectable(as: AuthenticationService<Credentials>)
@singleton
class AuthenticationServiceImpl extends AuthenticationService<Credentials> {
  AuthenticationServiceImpl(AuthCredentials authCredentials)
      : super(authCredentials.auth0ClientId, authCredentials.auth0DomainId);

  SocialConnection get connection {
    throw UnimplementedError('connection getter must be implemented');
  }

  @override
  Future<Credentials> signIn() async {
    try {
      Credentials response =
          await auth0.webAuthentication(scheme: 'demo').login();
      return response;
    } on WebAuthenticationException catch (e) {
      if (!kReleaseMode) {
        debugPrint(e.runtimeType.toString());
      }
      rethrow;
    }
  }

  @override
  Future<Credentials> getCredentials() async {
    try {
      Credentials response =
          await auth0.webAuthentication(scheme: 'demo').login();
      return response;
    } on WebAuthenticationException catch (e) {
      if (!kReleaseMode) {
        debugPrint(e.runtimeType.toString());
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await auth0.webAuthentication(scheme: 'demo').logout();
  }
}
