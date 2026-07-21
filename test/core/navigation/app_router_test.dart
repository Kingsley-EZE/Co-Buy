import 'package:co_buy/core/config/app_config.dart';
import 'package:co_buy/core/config/flavor.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/error/not_found_screen.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/core/usecase/usecase.dart';
import 'package:co_buy/features/alerts/domain/entities/app_notification.dart';
import 'package:co_buy/features/alerts/domain/usecases/get_notifications_usecase.dart';
import 'package:co_buy/features/alerts/domain/usecases/mark_notification_read_usecase.dart';
import 'package:co_buy/features/alerts/presentation/blocs/notifications_bloc/notifications_bloc.dart';
import 'package:co_buy/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/login_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/logout_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/resend_otp_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/trigger_otp_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/login_form_bloc/login_form_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/signup_form_bloc/signup_form_bloc.dart';
import 'package:co_buy/features/auth/presentation/pages/login_page.dart';
import 'package:co_buy/features/auth/presentation/pages/signup_page.dart';
import 'package:co_buy/features/home/domain/entities/pool.dart';
import 'package:co_buy/features/home/domain/usecases/get_pools_usecase.dart';
import 'package:co_buy/features/home/presentation/blocs/pools_bloc/pools_bloc.dart';
import 'package:co_buy/features/home/presentation/pages/home_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUseCase extends Mock implements LoginUseCase {}

class _MockSignupUseCase extends Mock implements SignupUseCase {}

class _MockVerifyEmailUseCase extends Mock implements VerifyEmailUseCase {}

class _MockResendOtpUseCase extends Mock implements ResendOtpUseCase {}

class _MockTriggerOtpUseCase extends Mock implements TriggerOtpUseCase {}

class _MockForgotPasswordUseCase extends Mock
    implements ForgotPasswordUseCase {}

class _MockResetPasswordUseCase extends Mock implements ResetPasswordUseCase {}

class _MockLogoutUseCase extends Mock implements LogoutUseCase {}

class _MockGetPoolsUseCase extends Mock implements GetPoolsUseCase {}

class _MockGetNotificationsUseCase extends Mock
    implements GetNotificationsUseCase {}

class _MockMarkNotificationReadUseCase extends Mock
    implements MarkNotificationReadUseCase {}

/// Real router over the generated route tree. Needs the app's
/// [rootNavigatorKey]: routes parented to the root navigator (e.g.
/// CreatePoolRoute) assert that their key belongs to the router.
GoRouter buildRouter([String initial = '/login']) => GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: initial,
  routes: $appRoutes,
  errorBuilder: (context, state) => NotFoundScreen(error: state.error),
);

Future<GoRouter> pumpRouter(
  WidgetTester tester, [
  String initial = '/login',
]) async {
  final router = buildRouter(initial);
  // Mirror MyApp: AuthBloc is provided above the router, not per page.
  await tester.pumpWidget(
    BlocProvider.value(
      value: getIt<AuthBloc>(),
      child: MaterialApp.router(theme: AppTheme.light, routerConfig: router),
    ),
  );
  await tester.pumpAndSettle();
  return router;
}

void main() {
  setUpAll(() {
    AppConfig.init(Flavor.dev);
    registerFallbackValue(const GetPoolsParams());
    registerFallbackValue(const NoParams());
  });

  setUp(() {
    // The blocs resolve from get_it; register AuthBloc with mocked use cases
    // so no real network wiring is needed.
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        _MockLoginUseCase(),
        _MockSignupUseCase(),
        _MockVerifyEmailUseCase(),
        _MockResendOtpUseCase(),
        _MockTriggerOtpUseCase(),
        _MockForgotPasswordUseCase(),
        _MockResetPasswordUseCase(),
        _MockLogoutUseCase(),
      ),
    );
    getIt.registerFactory<LoginFormBloc>(LoginFormBloc.new);
    getIt.registerFactory<SignupFormBloc>(SignupFormBloc.new);

    // HomePage fetches the feed on provide; resolve to an empty feed so the
    // page settles on the (static) empty state instead of a spinner, which
    // would make pumpAndSettle time out.
    final getPools = _MockGetPoolsUseCase();
    when(() => getPools(any())).thenAnswer((_) async => const Right(<Pool>[]));
    getIt.registerFactory<PoolsBloc>(() => PoolsBloc(getPools));

    // DashboardPage resolves NotificationsBloc from get_it and fetches on
    // init; resolve to an empty list so the badge settles instead of spinning.
    final getNotifications = _MockGetNotificationsUseCase();
    when(
      () => getNotifications(any()),
    ).thenAnswer((_) async => const Right(<AppNotification>[]));
    getIt.registerFactory<NotificationsBloc>(
      () => NotificationsBloc(
        getNotifications,
        _MockMarkNotificationReadUseCase(),
      ),
    );
  });

  tearDown(() => getIt.reset());

  group('typed route locations', () {
    test('resolve to the expected URLs', () {
      expect(const LoginRoute().location, '/login');
      expect(const SignupRoute().location, '/login/signup');
      expect(const HomeRoute().location, '/home');
    });
  });

  group('route rendering', () {
    testWidgets('initial location shows LoginPage', (tester) async {
      await pumpRouter(tester);

      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('/login/signup shows SignupPage with login in the back stack', (
      tester,
    ) async {
      final router = await pumpRouter(tester, '/login/signup');

      expect(find.byType(SignupPage), findsOneWidget);

      router.pop();
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('/home shows HomePage', (tester) async {
      await pumpRouter(tester, '/home');

      expect(find.byType(HomePage), findsOneWidget);
    });

    testWidgets('unknown location falls back to NotFoundScreen', (
      tester,
    ) async {
      await pumpRouter(tester, '/does-not-exist');

      expect(find.byType(NotFoundScreen), findsOneWidget);
    });
  });

  group('typed navigation', () {
    testWidgets('sign-up link on LoginPage navigates to SignupPage', (
      tester,
    ) async {
      await pumpRouter(tester);

      await tester.tap(find.text('Create Account'));
      await tester.pumpAndSettle();

      expect(find.byType(SignupPage), findsOneWidget);
    });

    testWidgets('HomeRoute().go reaches HomePage', (tester) async {
      final router = await pumpRouter(tester);

      const HomeRoute().go(router.routerDelegate.navigatorKey.currentContext!);
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
