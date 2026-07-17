import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../navigation/app_router.dart';

/// Registers the [GoRouter] (a type we don't own) with get_it.
@module
abstract class RouterModule {
  @singleton
  GoRouter get goRouter => createRouter();
}
