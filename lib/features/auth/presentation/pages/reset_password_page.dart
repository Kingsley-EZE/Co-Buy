import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/reset_password_form_bloc/reset_password_form_bloc.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key, required this.email});

  /// Account being reset — carried over from the forgot-password step.
  final String email;

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  static const _otpLength = 6;

  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _onResetPressed(BuildContext context) {
    final form = context.read<ResetPasswordFormBloc>().state;
    if (!form.canSubmit) return;
    context.read<AuthBloc>().add(
      AuthEvent.resetPasswordRequested(
        email: widget.email,
        otp: form.otp.trim(),
        newPassword: form.newPassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordFormBloc>(),
      child: AppScaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state case AuthFailure(:final message)) {
              AppSnackBar.showError(context, message);
            }
            if (state case AuthSuccess()) {
              AppSnackBar.showSuccess(context, 'Password Reset Successful');
              const LoginRoute().go(context);
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
                    'Reset Password',
                    style: context.styles.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    'Enter the code we sent to your email and choose a new '
                    'password',
                    style: context.styles.bodyL,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s32),
                  AppTextField(
                    label: 'OTP',
                    controller: _otpController,
                    validator: AppValidators.otp,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context
                        .read<ResetPasswordFormBloc>()
                        .add(ResetPasswordFormEvent.otpChanged(value)),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(_otpLength),
                    ],
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.oneTimeCode],
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  AppTextField(
                    label: 'New Password',
                    controller: _newPasswordController,
                    validator: (value) => AppValidators.required(
                      value,
                      message: 'New password is required',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context
                        .read<ResetPasswordFormBloc>()
                        .add(ResetPasswordFormEvent.newPasswordChanged(value)),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.newPassword],
                    onFieldSubmitted: (_) => _onResetPressed(context),
                  ),
                  const SizedBox(height: AppSpacing.s40),
                  // Rebuilds only when validity flips, not per keystroke.
                  BlocSelector<
                    ResetPasswordFormBloc,
                    ResetPasswordFormState,
                    bool
                  >(
                    selector: (state) => state.canSubmit,
                    builder: (context, canSubmit) => AppButton(
                      label: 'Reset Password',
                      loading: isLoading,
                      onPressed: canSubmit
                          ? () => _onResetPressed(context)
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
