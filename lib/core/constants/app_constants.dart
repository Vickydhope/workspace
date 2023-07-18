import 'package:flutter/material.dart';

class AppColorConstants {
  static const primaryColor50 = Color(0xFFFFF9E4);
  static const primaryColor100 = Color(0xFFFFEDBA);
  static const primaryColor200 = Color(0xFFFFE28F);
  static const primaryColor300 = Color(0xFFFFD864);
  static const primaryColor400 = Color(0xFFFFCE4A);
  static const primaryColor500 = Color(0xFFFFC63F);
  static const primaryColor600 = Color(0xFFFFB83A);
  static const primaryColor700 = Color(0xFFFFA636);
  static const primaryColor800 = Color(0xFFFE9734);
  static const primaryColor900 = Color(0xFFFB7A30);
  static const accentColor = Color(0xFFFFC63F);

  MaterialColor primarySwatch = const MaterialColor(
    0xFFFFC63F,
    <int, Color>{
      50: primaryColor50,
      100: primaryColor100,
      200: primaryColor200,
      300: primaryColor300,
      400: primaryColor400,
      500: primaryColor500,
      600: primaryColor600,
      700: primaryColor700,
      800: primaryColor800,
      900: primaryColor900,
    },
  );
}
