import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/features/auth/presentation/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLoginAndRedirect() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      if (mounted) {
        context.read<AuthBloc>().add(RequestLoginStatus());
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLoginAndRedirect();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => const Scaffold(
        body: Center(
          child: FlutterLogo(size: 100),
        ),
      ),
    );
  }
}
