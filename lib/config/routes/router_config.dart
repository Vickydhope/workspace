import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workspace/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:workspace/features/auth/presentation/pages/splashscreen.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  //Post Login
  dashboard("/dashboard"),
  settings("/settings"),

  //Auth Page
  login("/auth/signin"),
  signin("/auth/signup"),
  ;

  final String path;

  const Routes(this.path);
}

class AppRoutes {
  static GoRouter router(BuildContext context) => GoRouter(
        initialLocation: Routes.splashScreen.path,
        routerNeglect: true,
        debugLogDiagnostics: kDebugMode,
        refreshListenable:
            GoRouterRefreshStream(context.read<AuthBloc>().stream),
        redirect: (context, state) {

          if(true){
            return Routes.splashScreen.path;
          }


          return null;
        },
        routes: [
          GoRoute(
            path: Routes.splashScreen.path,
            name: Routes.splashScreen.name,
            builder: (context, state) => const SplashScreen(),
          )
        ],
      );
}

/// Converts a [Stream] into a [Listenable]

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  /// Creates a [GoRouterRefreshStream].
  ///
  /// Every time the [stream] receives an event the [GoRouter] will refresh its
  /// current route.
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription =
        stream.asBroadcastStream().listen((event) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
