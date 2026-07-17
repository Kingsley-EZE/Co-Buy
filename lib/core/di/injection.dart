import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

/// Registers every `@injectable`/`@module` class with get_it.
///
/// Call once from `bootstrap()`, after `AppConfig.init` (the network module
/// reads the active flavor's [Env] from there).
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => getIt.init();
