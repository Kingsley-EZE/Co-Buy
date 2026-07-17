import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/config/app_config.dart';
import '../core/design_system/design_system.dart';
import '../core/di/injection.dart';
import '../features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';

/// Root widget of the application.
///
/// Reads flavor-aware settings from [AppConfig] (e.g. the app title), so the
/// same widget renders correctly for every flavor.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // `.value` because get_it owns the singleton's lifecycle — a `create`
    // provider would close the bloc if this widget were ever disposed.
    return BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: MaterialApp.router(
        title: AppConfig.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: getIt<GoRouter>(),
      ),
    );
  }
}
