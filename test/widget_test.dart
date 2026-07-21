// Basic smoke test for the flavor-aware app shell.

import 'package:co_buy/app/app.dart';
import 'package:co_buy/core/config/app_config.dart';
import 'package:co_buy/core/config/flavor.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/app_router.dart';
import 'package:co_buy/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/login_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/logout_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/resend_otp_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/login_form_bloc/login_form_bloc.dart';
import 'package:co_buy/features/auth/presentation/pages/onboarding_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUseCase extends Mock implements LoginUseCase {}

class _MockSignupUseCase extends Mock implements SignupUseCase {}

class _MockVerifyEmailUseCase extends Mock implements VerifyEmailUseCase {}

class _MockResendOtpUseCase extends Mock implements ResendOtpUseCase {}

class _MockForgotPasswordUseCase extends Mock
    implements ForgotPasswordUseCase {}

class _MockResetPasswordUseCase extends Mock implements ResetPasswordUseCase {}

class _MockLogoutUseCase extends Mock implements LogoutUseCase {}

void main() {
  setUp(() {
    // MyApp resolves the router from get_it.
    getIt.registerSingleton<GoRouter>(createRouter());
    // The blocs resolve from get_it; register AuthBloc with mocked use cases
    // so no real network wiring is needed.
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        _MockLoginUseCase(),
        _MockSignupUseCase(),
        _MockVerifyEmailUseCase(),
        _MockResendOtpUseCase(),
        _MockForgotPasswordUseCase(),
        _MockResetPasswordUseCase(),
        _MockLogoutUseCase(),
      ),
    );
    getIt.registerFactory<LoginFormBloc>(LoginFormBloc.new);
  });

  tearDown(() => getIt.reset());

  testWidgets('renders the onboarding page as the initial route', (
    WidgetTester tester,
  ) async {
    // Configuration must be initialised before the app widget is built.
    AppConfig.init(Flavor.prod);

    await tester.pumpWidget(const MyApp());

    expect(find.byType(OnboardingPage), findsOneWidget);
  });
}
