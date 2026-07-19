# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

Co Buy is a Flutter app (group-buying "pools") built feature-first with Clean Architecture layers and BLoC. It ships in two flavors (dev/prod) that install side-by-side. The README.md documents environment setup, flavors, and navigation in depth — read the relevant section there before changing env vars or routes.

## Commands

The Flutter SDK is pinned via **fvm** (3.44.4). **Every** `flutter`/`dart` command must be prefixed with `fvm` — bare `flutter` may use the wrong SDK. The Makefile wraps the common ones:

```bash
make get        # fvm flutter pub get
make gen        # fvm dart run build_runner build --delete-conflicting-outputs
make watch      # codegen on save
make analyze    # fvm dart analyze
make format     # fvm dart format lib test
make test       # fvm flutter test
make run-dev    # fvm flutter run --flavor dev  -t lib/main_dev.dart
make run-prod   # fvm flutter run --flavor prod -t lib/main_prod.dart
```

Run a single test file: `fvm flutter test test/features/auth/auth_repository_impl_test.dart`

**Codegen is required to compile.** freezed, retrofit, injectable, go_router_builder, envied, json_serializable, and flutter_gen all emit generated files (`*.g.dart`, `*.freezed.dart`, `injection.config.dart`, `routes.g.dart`, `lib/gen/`). Run `make gen` after touching any annotated file. Never hand-edit generated files. Errors like `The method '$SomeRoute' isn't defined` or `Undefined name '_EnvDev'` mean stale/missing generated code — regenerate.

## Startup flow

`main_dev.dart` / `main_prod.dart` → `bootstrap(Flavor.x)` (lib/bootstrap.dart) → `AppConfig.init(flavor)` → `configureDependencies()` → `runApp(MyApp)`. Ordering matters: DI must run after `AppConfig.init` because the network module reads the active flavor's `Env` (base URL) from it. Env values come from gitignored `.env.dev`/`.env.prod` via envied — adding a variable is a 4-step procedure documented in README.md ("Adding a new environment variable").

## Architecture

Each feature under `lib/features/<name>/` has three layers (see `auth` for the complete reference implementation):

```
domain/
  entities/       # plain Equatable classes, no Flutter/dio/json imports
  repositories/   # abstract repository contracts
  usecases/       # one class per operation
data/
  datasources/    # Retrofit @RestApi() abstract classes (impl generated)
  dtos/           # @JsonSerializable request/response models — never leave the data layer
  mappers/        # extension methods: Dto.toEntity() / Entity.toDto()
  repositories/   # repository impls
presentation/
  blocs/          # one folder per bloc: x_bloc.dart + x_event.dart + x_state.dart (freezed parts)
  pages/
  widgets/
```

**Data flow:** page → bloc → use case → repository interface → repository impl → Retrofit data source. Presentation never calls repositories directly — always through a use case implementing `UseCase<T, Params>` (`core/usecase/usecase.dart`; use `NoParams` when there's no input).

**Error handling:** no exceptions cross the repository boundary. Every repository/use-case method returns `FutureResult<T>` (= `Future<Either<Failure, T>>`, `core/error/result.dart`). Repository impls wrap calls in try/catch, map `DioException` through `mapDioException` (`core/error/dio_error_mapper.dart`) to a sealed `Failure` subtype, and fall back to `UnknownFailure`. Blocs consume results with `result.fold(...)` and put `failure.message` in state — never rethrow.

**Dependency injection** (get_it + injectable): `@injectable` on use cases and form blocs, `@LazySingleton(as: Interface)` on repository impls and `AppNavigator`. App-lifetime blocs (e.g. `AuthBloc`) are `@LazySingleton(dispose: ...)` with a top-level dispose function. Third-party types and Retrofit clients that annotations can't construct are registered in `core/di/service_module.dart` (data sources take `@Named('appDio') Dio`); the router in `core/di/router_module.dart`. Regenerate after adding any injectable.

## BLoC culture

Two kinds of bloc, deliberately separated:

- **Form blocs** (`LoginFormBloc`, `SignupFormBloc`, ...) — page-scoped, `@injectable`, created in the page via `BlocProvider(create: (_) => getIt<XFormBloc>())`. They own field values, toggles, and validity only. Validation is expressed as **derived getters on the freezed state** (`emailError`, `canSubmit`) using `core/validation/app_validators.dart` — not stored flags. No use cases inside form blocs.
- **Feature blocs** (`AuthBloc`) — own submission and business state, call use cases. App-wide singletons are provided at the root with `BlocProvider.value(value: getIt<AuthBloc>())` (`.value`, because get_it owns the lifecycle).

States and events are **freezed** unions declared as `part` files next to the bloc. Pages are **pure renderers**: widgets dispatch events and read state; no validation or business logic in widgets. Use `BlocSelector` for narrow rebuilds (e.g. rebuild the submit button only when `canSubmit` flips, not per keystroke), `BlocConsumer`/listener for side effects (snackbars via `AppSnackBar`, navigation on success).

## Navigation

Type-safe go_router via go_router_builder — **no route strings at call sites, ever**. Routes are `GoRouteData` classes in `core/navigation/routes.dart`; navigate with `const LoginRoute().go(context)` (replace stack) or `.push(context)` (stack on top). The dashboard is a `StatefulShellRoute` with four branches (home, pools, alerts, profile), each with its own navigator key; enter it with `DashboardShellRoute.go(context)`. Routes that must cover the bottom bar set `$parentNavigatorKey = rootNavigatorKey`.

Rules: pass **IDs as path params, never whole objects via `$extra`** — the destination fetches its own data. Nest child routes under their parent so back stacks stay deep-link-ready. From blocs/use cases (no `BuildContext`) depend on the `AppNavigator` interface, never on GoRouter. Regenerate after any `routes.dart` change. Step-by-step recipes are in README.md ("Adding a new route").

## Design system & UI

Everything visual comes from `core/design_system/` — import the barrel: `package:co_buy/core/design_system/design_system.dart`.

- Colors: `context.colors.*` (theme-aware) or `AppPalette` for brand constants. Text styles: `context.styles.*` (with modifiers like `.semibold`). Spacing/radius: `AppSpacing.*`, `AppRadius.*`. **No hardcoded colors, font sizes, or magic-number paddings.**
- Shared widgets live in `core/components/` (`AppButton`, `AppTextField`, `AppScaffold`, `AppSnackBar`) — use and extend these rather than raw Material equivalents. Page-private widgets are private classes in the page file.
- Assets are typed via flutter_gen: `Assets.icons.icPageLogo.svg(...)` — never string asset paths. Re-run `make gen` after adding assets.

## Testing

`flutter_test` + **mocktail** (mock classes: `class MockX extends Mock implements X {}`, `registerFallbackValue` in `setUpAll` for custom argument types) and `http_mock_adapter` for Dio-level data source tests. Tests mirror the lib structure under `test/`. Descriptive sentence-style test names ('login persists the access token and returns the signed-in user').

## Conventions

- Use case files end `_usecase.dart`, classes end `UseCase`. DTOs end `_dto.dart`, mappers `_mapper.dart`. Bloc folders are `<name>_bloc/`.
- Doc comments explain *why* (lifecycle choices, ordering constraints), matching the existing style.
- Never add a `Co-Authored-By` trailer to commits.
