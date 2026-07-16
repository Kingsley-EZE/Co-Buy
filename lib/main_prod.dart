import 'bootstrap.dart';
import 'core/config/flavor.dart';

/// Entrypoint for the production flavor.
/// Run with: `fvm flutter run --flavor prod -t lib/main_prod.dart`
void main() => bootstrap(Flavor.prod);
