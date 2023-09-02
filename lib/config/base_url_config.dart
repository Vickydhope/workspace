import 'package:injectable/injectable.dart';

@injectable
class BaseUrlConfig {
  /// Header
  final requiredToken = 'required_token';

  /// Base url
  final baseUrlDevelopment = 'https://www.themealdb.com';
  final baseUrlProduction = 'https://www.themealdb.com';
  final baseUrlStaging = 'https://www.themealdb.com';

  /// Prefix
  final prefixEndpointV2 = '/api/json/v1/1';

  static const endpointCategories = '/categories.php';
  static const endpointArea = '/list.php?a=list';
  static const endpointRandomMeal = '/random.php';

  //Auth0 Config
  //Domains Ids
  final auth0DomainProd = 'doops178-prod.us.auth0.com';
  final auth0DomainDev = 'doops178.us.auth0.com';
  final auth0DomainStg = 'doops178-stg.us.auth0.com';

  final auth0ClientIdProd = 'VAEklIlNP3JlrTch9KxsnfanCLuPiFsK';
  final auth0ClientIdDev = 't1BWrNJzVmIlcSwlTN2PfL8zkOv0IiNZ';
  final auth0ClientIdStg = 'v5gw4PFKyOSg1yIucXz690tJvUcPsn8f';
}
