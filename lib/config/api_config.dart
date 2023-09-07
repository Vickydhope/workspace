import 'package:injectable/injectable.dart';
import 'package:workspace/config/di/injection.dart';

abstract class ApiConfig {
  final String baseUrl;

  ApiConfig._internal(this.baseUrl);
}

@development
@Injectable(as: ApiConfig)
class ApiConfigDev implements ApiConfig {
  @override
  String get baseUrl => "https://www.themealdb.com/dev";
}

@production
@Injectable(as: ApiConfig)
class ApiConfigProd implements ApiConfig {
  @override
  String get baseUrl => "https://www.themealdb.com";
}

@staging
@Injectable(as: ApiConfig)
class ApiConfigStg implements ApiConfig {
  @override
  String get baseUrl => "https://www.themealdb.com/stg";
}
