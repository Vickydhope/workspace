import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workspace/config/base_url_config.dart';
import 'package:workspace/config/flavor_config.dart';
import 'package:workspace/config/di/injection.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final baseUrlConfig = BaseUrlConfig();
  FlavorConfig(
    flavor: Flavor.development,
    colorPrimary: Colors.red,
    values: FlavorValues(
      baseUrlNewsEndpoint:
          baseUrlConfig.baseUrlDevelopment + baseUrlConfig.prefixEndpointV2,
    ),
  );
  await configureDependencies(environment: development);
  runApp(const App());
}
