import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/features/auth/presentation/bloc/auth_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign In"),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthBloc>()

                    .add(RequestSignin(email: "email", password: "password"));
              },
              child: Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(Logout());
              },
              child: Text("UnAuthenticate"),
            ),
          ],
        ),
      ),
    );
  }
}
