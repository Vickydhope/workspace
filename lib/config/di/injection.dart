import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

const production = Environment("production");
const development = Environment("development");
const staging = Environment("staging");

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<GetIt> configureDependencies({
  required Environment environment,
}) async =>
    getIt.init(
      environment: environment.name,
    );
