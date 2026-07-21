import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/login_form_bloc/login_form_bloc.dart';
import 'package:co_buy/features/auth/presentation/widgets/confirm_otp_sheet.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  /// OTP sheet owns auth states while open — page listener must stand down.
  bool _isOtpSheetOpen = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _showOtpSheet(BuildContext context, String email) async {
    final authBloc = context.read<AuthBloc>();
    final formBloc = context.read<LoginFormBloc>();

    _isOtpSheetOpen = true;
    final code = await ConfirmOtpSheet.show(
      context,
      subtitle: 'Type one time code we sent to your email',
      onSubmit: (otp) =>
          authBloc.add(AuthEvent.verifyEmailRequested(email: email, otp: otp)),
      onResend: () => authBloc.add(AuthEvent.resendOtpRequested(email: email)),
    );
    _isOtpSheetOpen = false;

    if (code == null || !context.mounted) return;
    authBloc.add(
      AuthEvent.loginRequested(
        email: formBloc.state.email.trim(),
        password: formBloc.state.password,
      ),
    );
  }

  void _onLoginPressed(BuildContext context) {
    final form = context.read<LoginFormBloc>().state;
    if (!form.canSubmit) return;
    context.read<AuthBloc>().add(
      AuthEvent.loginRequested(
        email: form.email.trim(),
        password: form.password,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Page-scoped form bloc; AuthBloc is app-wide.
    return BlocProvider(
      create: (_) => getIt<LoginFormBloc>(),
      child: AppScaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (_isOtpSheetOpen) return;
            if (state case AuthFailure(:final message)) {
              AppSnackBar.showError(context, message);
            }
            if (state case AuthAuthenticated()) {
              DashboardShellRoute.go(context);
            }
            if (state case AuthVerificationRequired(:final email)) {
              _showOtpSheet(context, email);
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
                    'Welcome back',
                    style: context.styles.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    'Pick up right where you left off.',
                    style: context.styles.bodyL,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s32),
                  AppTextField(
                    label: 'Email',
                    controller: _emailController,
                    validator: AppValidators.email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context.read<LoginFormBloc>().add(
                      LoginFormEvent.emailChanged(value),
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
                    onChanged: (value) => context.read<LoginFormBloc>().add(
                      LoginFormEvent.passwordChanged(value),
                    ),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.password],
                    onFieldSubmitted: (_) => _onLoginPressed(context),
                  ),
                  const SizedBox(height: AppSpacing.s20),
                  Row(
                    children: [
                      BlocSelector<LoginFormBloc, LoginFormState, bool>(
                        selector: (state) => state.rememberMe,
                        builder: (context, rememberMe) => GestureDetector(
                          onTap: () => context.read<LoginFormBloc>().add(
                            const LoginFormEvent.rememberMeToggled(),
                          ),
                          behavior: HitTestBehavior.opaque,
                          child: Row(
                            children: [
                              _CheckBox(checked: rememberMe),
                              const SizedBox(width: AppSpacing.s12),
                              Text(
                                'Remember me',
                                style: context.styles.bodyM.semibold,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      _LinkText(
                        'Forgot Password?',
                        onTap: () => const ForgotPasswordRoute().go(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.s40),
                  // Rebuilds only when validity flips, not per keystroke.
                  BlocSelector<LoginFormBloc, LoginFormState, bool>(
                    selector: (state) => state.canSubmit,
                    builder: (context, canSubmit) => AppButton(
                      label: 'Sign In',
                      loading: isLoading,
                      onPressed: canSubmit
                          ? () => _onLoginPressed(context)
                          : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: context.styles.bodyM.copyWith(
                          color: context.colors.text.subtle,
                        ),
                      ),
                      _LinkText(
                        'Create Account',
                        onTap: () => const SignupRoute().go(context),
                      ),
                    ],
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

/// Design checkbox: brand-purple squircle with a thick rounded check —
/// Material's [Checkbox] can't match the corner radius or check weight.
class _CheckBox extends StatelessWidget {
  const _CheckBox({required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      checked: checked,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: AppSpacing.s20,
        height: AppSpacing.s20,
        decoration: BoxDecoration(
          color: checked ? context.colors.button.primary : Colors.transparent,
          borderRadius: AppRadius.br6,
          border: checked
              ? null
              : Border.all(color: context.colors.stroke.primary, width: 1.5),
        ),
        child: checked
            ? Icon(
                Icons.check_rounded,
                size: AppSpacing.s16,
                color: context.colors.text.neutral,
              )
            : null,
      ),
    );
  }
}

class _LinkText extends StatelessWidget {
  const _LinkText(this.label, {required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: context.styles.bodyM.semibold.copyWith(
          color: AppPalette.primaryBase,
          decoration: TextDecoration.underline,
          decorationColor: AppPalette.primaryBase,
        ),
      ),
    );
  }
}
