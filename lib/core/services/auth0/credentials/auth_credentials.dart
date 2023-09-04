import 'package:injectable/injectable.dart';
import 'package:workspace/config/di/injection.dart';


//Auth0 Config
//Domains Ids
const _auth0DomainProd = 'doops178-prod.us.auth0.com';
const _auth0DomainDev = 'doops178.us.auth0.com';
const _auth0DomainStg = 'doops178-stg.us.auth0.com';

const _auth0ClientIdProd = 'VAEklIlNP3JlrTch9KxsnfanCLuPiFsK';
const _auth0ClientIdDev = 't1BWrNJzVmIlcSwlTN2PfL8zkOv0IiNZ';
const _auth0ClientIdStg = 'v5gw4PFKyOSg1yIucXz690tJvUcPsn8f';


abstract class AuthCredentials {
  final String auth0DomainId;
  final String auth0ClientId;
  final String auth0SecretKey;

  AuthCredentials.internal(
      this.auth0ClientId, this.auth0DomainId, this.auth0SecretKey);
}

@production
@Injectable(as: AuthCredentials)
class AuthCredentialsProd implements AuthCredentials {
  @override
  String get auth0ClientId => _auth0ClientIdProd;

  @override
  String get auth0DomainId => _auth0DomainProd;

  @override
  String get auth0SecretKey => throw UnimplementedError();
}

@development
@Injectable(as: AuthCredentials)
class AuthCredentialsDev implements AuthCredentials {
  @override
  String get auth0ClientId => _auth0ClientIdDev;

  @override
  String get auth0DomainId => _auth0DomainDev;

  @override
  String get auth0SecretKey => throw UnimplementedError();
}

@staging
@Injectable(as: AuthCredentials)
class AuthCredentialsStaging implements AuthCredentials {
  @override
  String get auth0ClientId => _auth0ClientIdStg;

  @override
  String get auth0DomainId => _auth0DomainStg;

  @override
  String get auth0SecretKey => throw UnimplementedError();
}