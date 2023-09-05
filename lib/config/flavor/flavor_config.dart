/*
import 'package:flutter/material.dart';
import 'package:workspace/config/base_url_config.dart';

enum Flavor { production, development, staging }


class FlavorValues {
  final String baseUrlNewsEndpoint;

  FlavorValues({
    required this.baseUrlNewsEndpoint,
  });
}

abstract class FlavorConfig {
  final Flavor flavor;
  final Color colorPrimary;
  final FlavorValues values;
  static late FlavorConfig _instance;

  FlavorConfig._internal(this.flavor, this.values, this.colorPrimary);
}


class FlavorConfigDevImpl implements FlavorConfig {
  final BaseUrlConfig baseUrlConfig;

  FlavorConfigDevImpl(this.baseUrlConfig);

  @override
  Color get colorPrimary => Colors.green;

  @override
  Flavor get flavor => Flavor.development;

  @override
  FlavorValues get values =>
      FlavorValues(baseUrlNewsEndpoint: baseUrlConfig.baseUrlDevelopment);


}


class FlavorConfigDev implements FlavorConfig {
  final Flavor? flavor;
  final String name;
  final Color colorPrimary;
  final Color colorPrimaryDark;
  final Color colorPrimaryLight;
  final Color colorAccent;
  final FlavorValues values;

  static late FlavorConfig _instance;

  factory FlavorConfig({required Flavor? flavor,
    Color colorPrimary = Colors.blue,
    Color colorPrimaryDark = Colors.blue,
    Color colorPrimaryLight = Colors.blue,
    Color colorAccent = Colors.blueAccent,
    required FlavorValues values}) {
    _instance = FlavorConfig._internal(
      flavor,
      enumName(flavor.toString()),
      colorPrimary,
      colorPrimaryDark,
      colorPrimaryLight,
      colorAccent,
      values,
    );

    return _instance;
  }

  static FlavorConfig get instance => _instance;

  FlavorConfig._internal(this.flavor,
      this.name,
      this.colorPrimary,
      this.colorPrimaryDark,
      this.colorPrimaryLight,
      this.colorAccent,
      this.values,);

  static String enumName(String enumToString) {
    final paths = enumToString.split('.');
    return paths[paths.length - 1];
  }

  static bool isProduction() => _instance.flavor == Flavor.production;

  static bool isDevelopment() => _instance.flavor == Flavor.development;
}
*/
