# co_buy

A Flutter application built with a feature-first, layered architecture and two
build flavors (**Dev** / **Prod**) that can be installed side-by-side.

---

## Tech stack

| Concern            | Choice                                              |
| ------------------ | --------------------------------------------------- |
| State management   | `flutter_bloc`                                      |
| Navigation         | `go_router` + `go_router_builder` (type-safe routes)|
| Dependency injection | `get_it` + `injectable`                            |
| Networking         | `dio` + `retrofit` (type-safe API client)           |
| Secure storage     | `flutter_secure_storage`                            |
| Env config         | `envied` (compile-time, obfuscated, type-safe)      |
| Codegen            | `build_runner` (retrofit, json_serializable, envied)|
| Flutter SDK        | **3.44.4**, pinned via **fvm**                       |

---

## Prerequisites

- **[fvm](https://fvm.app/)** — this repo pins the Flutter SDK version, so all
  Flutter/Dart commands are run through `fvm`.
  ```bash
  dart pub global activate fvm     # or: brew install fvm
  ```
- **Xcode** (iOS builds) and/or **Android Studio + Android SDK** (Android builds).
- A configured simulator/emulator or a physical device.

> Every `flutter` / `dart` command below is prefixed with `fvm`. Running the bare
> `flutter` may use a different SDK than the project expects.

---

## Getting started

```bash
# 1. Install the pinned Flutter SDK (first time only)
fvm install

# 2. Create your local environment files (see "Environment variables" below)
cp .env.example .env.dev
cp .env.example .env.prod
#   …then fill in real values in each file.

# 3. Fetch dependencies
fvm flutter pub get

# 4. Generate code (envied env classes, retrofit clients, json models)
fvm dart run build_runner build --delete-conflicting-outputs

# 5. Run the app (dev flavor)
fvm flutter run --flavor dev -t lib/main_dev.dart
```

If you skip step 4, the app won't compile — the generated `*.g.dart` files
(including the env classes) don't exist until `build_runner` runs.

---

## Running & building

The app has two flavors. Pick the matching entrypoint with `-t` and flavor with
`--flavor`:

```bash
# Development
fvm flutter run       --flavor dev  -t lib/main_dev.dart
fvm flutter build apk --flavor dev  -t lib/main_dev.dart

# Production
fvm flutter run        --flavor prod -t lib/main_prod.dart
fvm flutter build apk  --flavor prod -t lib/main_prod.dart
fvm flutter build ipa  --flavor prod -t lib/main_prod.dart
```

| Flavor | Android applicationId    | iOS bundle id           | App name   |
| ------ | ------------------------ | ----------------------- | ---------- |
| dev    | `com.example.co_buy.dev` | `com.example.coBuy.dev` | Co Buy Dev |
| prod   | `com.example.co_buy`     | `com.example.coBuy`     | Co Buy     |

**IDE shortcuts:** in VS Code pick **co_buy dev** / **co_buy prod** from the Run
panel (`.vscode/launch.json`). In Android Studio, create run configurations with
build flavor `dev`/`prod` and the matching Dart entrypoint.

---

## Environment variables

Per-environment values (API base URL, keys, …) live in **`.env.dev`** and
**`.env.prod`**. They are read **at build time** by [`envied`](https://pub.dev/packages/envied),
which generates obfuscated, type-safe Dart — the raw files are never bundled into
the app, so secrets stay out of the shipped APK/IPA.

Current keys and example values: [ENV details for Co-Buy](https://docs.google.com/document/d/1hEeAewTwpKCe4g15AQvILeFZQJMP9e9ftOvc58990CE/edit?usp=sharing).

- `.env.dev` / `.env.prod` are **gitignored**. Never commit real secrets.
- **`.env.example`** is committed and documents every required key. Keep it in
  sync when you add a variable.

### How the pieces connect

```
.env.dev  ──▶  EnvDev  (lib/core/config/env/env_dev.dart)  ─┐
.env.prod ──▶  EnvProd (lib/core/config/env/env_prod.dart) ─┼─▶ AppConfig.env ──▶ app code
                 implements Env (env.dart, the shared contract)
```

The active flavor is chosen in `bootstrap(Flavor.x)` (from `main_dev.dart` /
`main_prod.dart`); everything else reads values through `AppConfig.env`.

### Adding a new environment variable

Say you want to add `SENTRY_DSN`. Four edits, then regenerate:

1. **Add the key to every env file** — `.env.dev`, `.env.prod`, and `.env.example`:
   ```
   SENTRY_DSN=https://examplePublicKey@o0.ingest.sentry.io/0
   ```
2. **Add it to the contract** — `lib/core/config/env/env.dart`:
   ```dart
   String get sentryDsn;
   ```
3. **Add the field to both env classes** — `env_dev.dart` *and* `env_prod.dart`:
   ```dart
   @override
   @EnviedField(varName: 'SENTRY_DSN', obfuscate: true)
   final String sentryDsn = _EnvDev.sentryDsn;   // _EnvProd.sentryDsn in env_prod.dart
   ```
4. **Regenerate** the envied output:
   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

Now read it anywhere via `AppConfig.env.sentryDsn`.

> If a key exists in an env class but is missing from the matching `.env.*` file,
> `build_runner` fails with a clear "field not found" error — a useful guardrail.

---

## Navigation

Navigation is **type-safe** and **string-free at call sites**. Routes are
declared as `GoRouteData` classes and [`go_router_builder`](https://pub.dev/packages/go_router_builder)
generates the wiring — a missing or wrong-typed route parameter is a **compile
error**, not a runtime crash.

### How the pieces connect

```
routes.dart          declares @TypedGoRoute classes  ──▶  routes.g.dart ($appRoutes, generated)
app_router.dart      createRouter() consumes $appRoutes, adds the 404 errorBuilder
router_module.dart   registers GoRouter as a get_it singleton
app.dart             MaterialApp.router(routerConfig: getIt<GoRouter>())
```

For navigation from **blocs / use cases** (no `BuildContext`), depend on the
`AppNavigator` interface — never on `GoRouter` directly. It's registered via DI
and keeps domain/presentation code free of the routing package.

```
lib/core/navigation/
├── routes.dart              # @TypedGoRoute route classes (edit this to add routes)
├── routes.g.dart            # GENERATED — do not edit
├── app_router.dart          # createRouter(): GoRouter config + 404 errorBuilder
├── app_navigator.dart       # context-less interface (no Flutter/go_router imports)
└── go_router_navigator.dart # AppNavigator impl, @LazySingleton(as: AppNavigator)
lib/core/di/router_module.dart  # @module registering GoRouter with get_it
lib/core/error/not_found_screen.dart  # 404 fallback (errorBuilder)
```

### Current routes

| Screen  | URL             | Navigate with                     |
| ------- | --------------- | --------------------------------- |
| Login   | `/login`        | `const LoginRoute().go(context)`  |
| Signup  | `/login/signup` | `const SignupRoute().go(context)` |
| Home    | `/home`         | `const HomeRoute().go(context)`   |

`.go(context)` **replaces** the current stack; `.push(context)` **stacks on
top**. Every route also exposes `.location` (the resolved URL string), used for
`initialLocation` and by `AppNavigator`.

### Adding a new route (no data)

Say you want a `SettingsPage` at `/settings`. Three edits, then regenerate:

1. **Create the screen** — e.g. `lib/features/settings/presentation/pages/settings_page.dart`.
2. **Declare the route** in `lib/core/navigation/routes.dart`:
   ```dart
   @TypedGoRoute<SettingsRoute>(path: '/settings')
   class SettingsRoute extends GoRouteData with $SettingsRoute {
     const SettingsRoute();

     @override
     Widget build(BuildContext context, GoRouterState state) =>
         const SettingsPage();
   }
   ```
   (Add the `import` for the new page at the top of the file.)
3. **Regenerate** so `$SettingsRoute` and `$appRoutes` are updated:
   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

Navigate to it from anywhere: `const SettingsRoute().go(context)`.

### Adding a new route (with data)

**Rule: pass an ID as a path param — never the whole object via `$extra`.** The
destination fetches its own data from the ID. This keeps routes deep-link-ready
and web/state-restoration safe.

Say you want an `OrderDetailsPage` that needs an `int orderId`, nested under
`/home` so Home stays in the back stack:

1. **Create the screen** taking the typed value:
   ```dart
   class OrderDetailsPage extends StatelessWidget {
     const OrderDetailsPage({super.key, required this.orderId});
     final int orderId;
     // …fetch the order from orderId here (bloc/usecase), don't pass the object in.
   }
   ```
2. **Declare the route** in `lib/core/navigation/routes.dart`. Add it as a child
   of the parent route via the `routes:` list, and put the param in the path with
   `:name`:
   ```dart
   @TypedGoRoute<HomeRoute>(
     path: '/home',
     routes: <TypedRoute<RouteData>>[
       TypedGoRoute<OrderDetailsRoute>(path: 'orders/:orderId'),
     ],
   )
   class HomeRoute extends GoRouteData with $HomeRoute {
     const HomeRoute();

     @override
     Widget build(BuildContext context, GoRouterState state) => const HomePage();
   }

   class OrderDetailsRoute extends GoRouteData with $OrderDetailsRoute {
     const OrderDetailsRoute({required this.orderId});

     final int orderId; // codegen converts the String <-> int at the URL boundary

     @override
     Widget build(BuildContext context, GoRouterState state) =>
         OrderDetailsPage(orderId: orderId);
   }
   ```
3. **Regenerate**:
   ```bash
   fvm dart run build_runner build --delete-conflicting-outputs
   ```

Navigate with the value — checked at compile time:
```dart
const OrderDetailsRoute(orderId: 42).push(context); // resolves to /home/orders/42
// const OrderDetailsRoute().push(context);  // COMPILE ERROR: missing 'orderId'
```

**Param rules:**
- **Path params** (`:name` in the path) — non-nullable constructor fields.
  Supported types: `String`, `int`, `num`, `bool`, `enum`.
- **Query params** — any *other* constructor field; make it nullable or give it a
  default, e.g. `const SearchRoute({this.q})` → `/search?q=shoes`.
- **Full-screen over a shell** (hide bottom bar, if one is added later) — set
  `static final $parentNavigatorKey = rootNavigatorKey;` on the route class.

> After **any** change to `routes.dart`, re-run `build_runner`. If you see
> `The method '$SomeRoute' isn't defined` or `$appRoutes` errors, it's stale
> generated code — regenerate.

---

## Project structure

```
lib/
├── main_dev.dart          # dev entrypoint  → bootstrap(Flavor.dev)
├── main_prod.dart         # prod entrypoint → bootstrap(Flavor.prod)
├── bootstrap.dart         # shared startup (binding, config, DI, runApp)
├── app/
│   └── app.dart           # root MyApp widget (MaterialApp.router)
└── core/
    ├── config/
    │   ├── flavor.dart        # Flavor enum
    │   ├── app_config.dart    # active flavor + resolved env values
    │   └── env/
    │       ├── env.dart       # Env contract (interface)
    │       ├── env_dev.dart   # @Envied(path: '.env.dev')
    │       ├── env_prod.dart  # @Envied(path: '.env.prod')
    │       └── *.g.dart       # generated (gitignored)
    ├── navigation/
    │   ├── routes.dart            # typed route classes (+ routes.g.dart, generated)
    │   ├── app_router.dart        # createRouter(): GoRouter config
    │   ├── app_navigator.dart     # context-less navigation interface
    │   └── go_router_navigator.dart  # AppNavigator implementation
    ├── di/
    │   └── router_module.dart     # registers GoRouter with get_it
    └── error/
        └── not_found_screen.dart  # 404 fallback
```

---

## Common commands

```bash
fvm flutter pub get                                       # install deps
fvm dart run build_runner build --delete-conflicting-outputs  # one-off codegen
fvm dart run build_runner watch --delete-conflicting-outputs  # codegen on save
fvm flutter analyze                                       # static analysis
fvm flutter test                                          # run tests
fvm flutter clean                                         # clear build cache
```

---

## Troubleshooting

- **`Undefined name '_EnvDev'` / missing `*.g.dart`** — run `build_runner` (step 4).
- **`build_runner` reports a field not found** — a key in an env class is missing
  from `.env.dev` or `.env.prod`. Add it and regenerate.
- **Wrong SDK / version errors** — you probably dropped the `fvm` prefix. Use
  `fvm flutter …`. Confirm the pinned version with `fvm flutter --version`.
