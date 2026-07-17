import 'package:co_buy/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../core/config/app_config.dart';
import '../core/design_system/design_system.dart';

/// Root widget of the application.
///
/// Reads flavor-aware settings from [AppConfig] (e.g. the app title), so the
/// same widget renders correctly for every flavor.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: LoginPage(title: AppConfig.appName),
    );
  }
}
