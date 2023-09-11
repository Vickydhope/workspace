import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:workspace/config/di/injection.dart';
import 'package:workspace/features/dashboard/presentation/pages/main_categories.dart';
import 'package:workspace/features/notifications/presentation/pages/notification.dart';
import 'package:workspace/features/auth/auth.dart';
import '../../features/news/presentation/pages/news_page.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  //Post Login
  dashboard("/dashboard"),
  settings("/settings"),
  notification("/notification"),
  //Auth Page
  login("/auth/signin"),
  signup("/auth/signup"),
  news("news/:id/:path"),
  ;

  final String path;

  const Routes(this.path);
}

class AppRoutes {
  static GoRouter get router => GoRouter(
        initialLocation: Routes.splashScreen.path,
        routerNeglect: true,
        debugLogDiagnostics: kDebugMode,
        refreshListenable: GoRouterRefreshStream(getIt<AuthBloc>().stream),
        redirect: (context, state) {
          print(state.matchedLocation);
          var authState = context.read<AuthBloc>().state;

          final bool userAuthenticated = authState is Authenticated;

          /*
          if (authState is AuthInitial) {
            return null;
          }*/

          final bool onLoginPage = state.matchedLocation == Routes.login.path ||
              state.matchedLocation == Routes.signup.path;

          final bool onSplash =
              state.matchedLocation == Routes.splashScreen.path;

          if (!userAuthenticated && authState is! Loading) {
            return onLoginPage ? null : Routes.login.path;
          }

          ///Allow navigation to root of application only where user is on Splashscreen or Auth (LoginPage/RegistrationPage) Path
          if (userAuthenticated) {
            return onLoginPage || onSplash ? Routes.root.path : null;
          }
          return null;
        },
        routes: [
          GoRoute(
            path: Routes.splashScreen.path,
            name: Routes.splashScreen.name,
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
              path: Routes.root.path,
              name: Routes.root.name,
              builder: (context, state) => const MainCategories(),
              routes: [
                GoRoute(
                  path: Routes.news.path,
                  name: Routes.news.name,
                  builder: (context, state) => NewsPage(
                    userId: state.pathParameters["id"].toString(),
                    path: state.pathParameters["path"].toString(),
                  ),
                ),
              ]),
          GoRoute(
            path: Routes.login.path,
            name: Routes.login.name,
            builder: (context, state) => const SignInPage(),
          ),
          GoRoute(
            path: Routes.notification.path,
            name: Routes.notification.name,
            builder: (context, state) => const NotificationPage(),
          ),
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
