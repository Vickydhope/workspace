import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workspace/config/di/injection.dart';
import 'package:workspace/config/flavor_config.dart';
import 'package:workspace/config/routes/router_config.dart';
import 'package:workspace/core/constants/app_constants.dart';
import 'package:workspace/features/dashboard/presentation/bloc/remote_category_bloc.dart';
import 'package:workspace/features/dashboard/presentation/pages/main_categories.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) =>
              getIt<RemoteCategoryBloc>()..add(GetCategories()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routerConfig: AppRoutes.router(context),
          debugShowCheckedModeBanner: !FlavorConfig.isProduction(),
          theme: ThemeData(primarySwatch: AppColorConstants().primarySwatch),
          builder: (context, child) => GestureDetector(
            onTap: () {
              hideSoftKeyboard();
            },
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            ),
          ),
        );
      }),
    );
  }

  hideSoftKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
