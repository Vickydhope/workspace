import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workspace/config/base_url_config.dart';
import 'package:workspace/config/flavor_config.dart';

import 'app.dart';
import 'config/di/injection.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final baseUrlConfig = BaseUrlConfig();

  FlavorConfig(
    flavor: Flavor.production,
    colorPrimary: Colors.green,
    values: FlavorValues(
      baseUrlNewsEndpoint: baseUrlConfig.baseUrlProduction + baseUrlConfig.prefixEndpointV2,
    ),
  );

  await configureDependencies(environment: production);


  runApp(const App());
}
