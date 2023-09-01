import '../authentication_with_social_connections.dart';

class SignInWithGoogle extends AuthenticationWithSocialConnections {
  @override
  SocialConnection get connection => SocialConnection.google;
}
