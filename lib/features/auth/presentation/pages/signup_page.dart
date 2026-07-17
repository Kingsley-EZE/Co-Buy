import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/signup_form_bloc/signup_form_bloc.dart';
import 'package:co_buy/features/auth/presentation/widgets/confirm_otp_sheet.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// While the OTP sheet is up it owns the auth states (inline error,
  /// spinner, pop on success), so the page listener must stand down —
  /// otherwise the verify flow's `AuthSuccess` would re-open the sheet.
  bool _isOtpSheetOpen = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Signup succeeded: collect the emailed OTP and verify it. The sheet pops
  /// with the code once `AuthBloc` reports the verification succeeded, or
  /// with `null` if the user closes it without verifying.
  Future<void> _showOtpSheet(BuildContext context) async {
    final authBloc = context.read<AuthBloc>();
    final email = context.read<SignupFormBloc>().state.email.trim();

    _isOtpSheetOpen = true;
    final code = await ConfirmOtpSheet.show(
      context,
      subtitle: 'Type one time code we sent to your email',
      onSubmit: (otp) => authBloc.add(
        AuthEvent.verifyEmailRequested(email: email, otp: otp),
      ),
    );
    _isOtpSheetOpen = false;

    if (code == null || !context.mounted) return;
    AppSnackBar.showSuccess(context, 'Verification Successful');
    const LoginRoute().go(context);
  }

  void _onSignupPressed(BuildContext context) {
    final form = context.read<SignupFormBloc>().state;
    if (!form.canSubmit) return;
    context.read<AuthBloc>().add(
      AuthEvent.signupRequested(
        firstName: form.firstName.trim(),
        lastName: form.lastName.trim(),
        email: form.email.trim(),
        password: form.password,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupFormBloc>(),
      child: AppScaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (_isOtpSheetOpen) return;
            if (state case AuthFailure(:final message)) {
              AppSnackBar.showError(context, message);
            }
            if (state case AuthSuccess()) {
              _showOtpSheet(context);
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
              ),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: AppSpacing.s48),
                  Center(
                    child: Assets.icons.icPageLogo.svg(height: AppSpacing.s64),
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  Text(
                    'Create Account',
                    style: context.styles.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    'Join the people around you and pool towards a certain goal',
                    style: context.styles.bodyL,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s32),
                  AppTextField(
                    label: 'First Name',
                    controller: _firstNameController,
                    validator: (value) => AppValidators.required(
                      value,
                      message: 'First name is required',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<SignupFormBloc>().add(
                      SignupFormEvent.firstNameChanged(value),
                    ),
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.givenName],
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  AppTextField(
                    label: 'Last Name',
                    controller: _lastNameController,
                    validator: (value) => AppValidators.required(
                      value,
                      message: 'Last name is required',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<SignupFormBloc>().add(
                      SignupFormEvent.lastNameChanged(value),
                    ),
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.familyName],
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  AppTextField(
                    label: 'Email',
                    controller: _emailController,
                    validator: AppValidators.email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<SignupFormBloc>().add(
                      SignupFormEvent.emailChanged(value),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.email],
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  AppTextField(
                    label: 'Password',
                    controller: _passwordController,
                    validator: (value) => AppValidators.required(
                      value,
                      message: 'Password is required',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<SignupFormBloc>().add(
                      SignupFormEvent.passwordChanged(value),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.newPassword],
                    onFieldSubmitted: (_) => _onSignupPressed(context),
                  ),
                  const SizedBox(height: AppSpacing.s40),
                  // Rebuilds only when validity flips, not per keystroke.
                  BlocSelector<SignupFormBloc, SignupFormState, bool>(
                    selector: (state) => state.canSubmit,
                    builder: (context, canSubmit) => AppButton(
                      label: 'Create Account',
                      loading: isLoading,
                      onPressed: canSubmit
                          ? () => _onSignupPressed(context)
                          : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
