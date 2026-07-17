// Basic smoke test for the flavor-aware app shell.

import 'package:co_buy/app/app.dart';
import 'package:co_buy/core/config/app_config.dart';
import 'package:co_buy/core/config/flavor.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/login_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/signup_usecase.dart';
import 'package:co_buy/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockLoginUseCase extends Mock implements LoginUseCase {}
class _MockSignupUseCase extends Mock implements SignupUseCase {}

class _MockVerifyEmailUseCase extends Mock implements VerifyEmailUseCase {}

class _MockForgotPasswordUseCase extends Mock
    implements ForgotPasswordUseCase {}

class _MockResetPasswordUseCase extends Mock implements ResetPasswordUseCase {}

void main() {
  setUp(() {
    // LoginPage resolves its bloc from get_it; register it with mocked
    // use cases so no real network wiring is needed.
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        _MockLoginUseCase(),
        _MockSignupUseCase(),
        _MockVerifyEmailUseCase(),
        _MockForgotPasswordUseCase(),
        _MockResetPasswordUseCase(),
      ),
    );
  });

  tearDown(() => getIt.reset());

  testWidgets('renders the login page', (WidgetTester tester) async {
    // Configuration must be initialised before the app widget is built.
    AppConfig.init(Flavor.prod);

    await tester.pumpWidget(const MyApp());

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Login'), findsOneWidget);
  });
}
