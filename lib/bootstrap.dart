import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/config/app_config.dart';
import 'core/config/flavor.dart';

/// Shared startup path for every flavor.
///
/// Flavor-specific entrypoints (`main_dev.dart`, `main_prod.dart`) call this
/// with their [Flavor] so all bootstrapping — binding init, configuration,
/// dependency injection — lives in one place instead of being duplicated per
/// entrypoint.
Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  AppConfig.init(flavor);

  // TODO: register dependencies (get_it), set up networking with
  // AppConfig.env.baseUrl, etc.

  runApp(const MyApp());
}
