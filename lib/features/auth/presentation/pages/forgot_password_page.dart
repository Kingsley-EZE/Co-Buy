import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/feedback/app_snackbar.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/core/navigation/routes.dart';
import 'package:co_buy/core/validation/app_validators.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:co_buy/features/auth/presentation/blocs/forgot_password_form_bloc/forgot_password_form_bloc.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSendCodePressed(BuildContext context) {
    final form = context.read<ForgotPasswordFormBloc>().state;
    if (!form.canSubmit) return;
    context.read<AuthBloc>().add(
      AuthEvent.forgotPasswordRequested(email: form.email.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordFormBloc>(),
      child: AppScaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            // This page stays in the stack under the reset page, so ignore
            // auth states emitted while it isn't the visible route —
            // otherwise the reset flow's `AuthSuccess` would re-navigate.
            if (ModalRoute.of(context)?.isCurrent != true) return;
            if (state case AuthFailure(:final message)) {
              AppSnackBar.showError(context, message);
            }
            if (state case AuthSuccess()) {
              final email = context
                  .read<ForgotPasswordFormBloc>()
                  .state
                  .email
                  .trim();
              ResetPasswordRoute(email: email).go(context);
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
                    'Forgot Password',
                    style: context.styles.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  Text(
                    "Enter the email linked to your account and we'll send "
                    'you a code to reset your password',
                    style: context.styles.bodyL,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.s32),
                  AppTextField(
                    label: 'Email',
                    controller: _emailController,
                    validator: AppValidators.email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) => context
                        .read<ForgotPasswordFormBloc>()
                        .add(ForgotPasswordFormEvent.emailChanged(value)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    autofillHints: const [AutofillHints.email],
                    onFieldSubmitted: (_) => _onSendCodePressed(context),
                  ),
                  const SizedBox(height: AppSpacing.s40),
                  // Rebuilds only when validity flips, not per keystroke.
                  BlocSelector<
                    ForgotPasswordFormBloc,
                    ForgotPasswordFormState,
                    bool
                  >(
                    selector: (state) => state.canSubmit,
                    builder: (context, canSubmit) => AppButton(
                      label: 'Send Code',
                      loading: isLoading,
                      onPressed: canSubmit
                          ? () => _onSendCodePressed(context)
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
