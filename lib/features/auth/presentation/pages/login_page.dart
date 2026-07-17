import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/atoms/app_text_field.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/core/di/injection.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthEvent.loginRequested(
            username: _usernameController.text.trim(),
            password: _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: AppScaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state case AuthFailure(:final message)) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(message)));
              }
              if (state case AuthSuccess()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Login Success")));
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    label: 'Username',
                    controller: _usernameController,
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                  ),
                  const SizedBox(height: AppSpacing.s16),
                  AppTextField(
                    label: 'Password',
                    controller: _passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _onLoginPressed(context),
                  ),
                  const SizedBox(height: AppSpacing.s24),
                  AppButton(
                    label: 'Login',
                    loading: isLoading,
                    onPressed: () => _onLoginPressed(context),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
