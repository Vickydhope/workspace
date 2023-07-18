import 'dart:async';

import 'package:flutter/material.dart';
import 'package:workspace/config/base_url_config.dart';
import 'package:workspace/config/flavor_config.dart';

import 'app.dart';
import 'config/di/injection.dart';

void main() async {
  final baseUrlConfig = BaseUrlConfig();

  FlavorConfig(
    flavor: Flavor.staging,
    colorPrimary: Colors.deepOrange,
    values: FlavorValues(
      baseUrlNewsEndpoint:
          baseUrlConfig.baseUrlStaging + baseUrlConfig.prefixEndpointV2,
    ),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
