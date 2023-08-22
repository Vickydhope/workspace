import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/features/auth/presentation/bloc/auth_bloc.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(Logout());
              },
              icon: const Icon(Icons.logout))
        ]),
        body: Center(
          child: Image.asset("assets/images/notification.png"),
        ));
  }
}
