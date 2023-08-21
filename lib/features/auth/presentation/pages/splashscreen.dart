import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("Splashscreen"),
        ),
      ),
    );
  }
}
