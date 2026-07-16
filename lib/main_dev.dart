import 'bootstrap.dart';
import 'core/config/flavor.dart';

/// Entrypoint for the development flavor.
/// Run with: `fvm flutter run --flavor dev -t lib/main_dev.dart`
void main() => bootstrap(Flavor.dev);
