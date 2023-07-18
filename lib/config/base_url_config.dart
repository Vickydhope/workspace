class BaseUrlConfig {
  /// Header
  final requiredToken = 'required_token';

  /// Base url
  final baseUrlDevelopment = 'https://www.themealdb.com';
  final baseUrlProduction = 'https://www.themealdb.com';
  final baseUrlStaging = 'https://www.themealdb.com';

  /// Prefix
  final prefixEndpointV2 = '/api/json/v1/1';


  static const  endpointCategories = '/categories.php';
  static const  endpointArea = '/list.php?a=list';
  static const endpointRandomMeal = '/random.php';

}
