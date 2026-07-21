import 'package:co_buy/core/components/atoms/app_button.dart';
import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/auth/domain/entities/user.dart';
import 'package:co_buy/features/auth/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBloc, AuthState, User?>(
      selector: (state) => switch (state) {
        AuthAuthenticated(:final user) => user,
        _ => null,
      },
      builder: (context, user) {
        if (user == null) return const SizedBox.shrink();
        return _ProfileView(user: user);
      },
    );
  }
}

class _ProfileView extends StatelessWidget {
  const _ProfileView({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenH,
                vertical: AppSpacing.s32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _AvatarCircle(user: user),
                  const SizedBox(height: AppSpacing.s32),
                  _InfoCard(user: user),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenH,
              AppSpacing.s16,
              AppSpacing.screenH,
              AppSpacing.s32,
            ),
            child: AppButton(
              label: 'Sign Out',
              variant: AppButtonVariant.danger,
              leadingIcon: Icons.logout_rounded,
              onPressed: () =>
                  context.read<AuthBloc>().add(const AuthEvent.logoutRequested()),
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  const _AvatarCircle({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final initials =
        '${user.firstName.isNotEmpty ? user.firstName[0] : ''}'
        '${user.lastName.isNotEmpty ? user.lastName[0] : ''}'
            .toUpperCase();

    return Center(
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          color: AppPalette.primaryLighter,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          initials,
          style: AppTypography.heading4.copyWith(color: AppPalette.primaryBase),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.bg.quaternary,
        borderRadius: BorderRadius.circular(AppRadius.r12),
      ),
      child: Column(
        children: [
          _InfoRow(label: 'First Name', value: user.firstName),
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.stroke.primary,
            indent: AppSpacing.s16,
            endIndent: AppSpacing.s16,
          ),
          _InfoRow(label: 'Last Name', value: user.lastName),
          Divider(
            height: 1,
            thickness: 1,
            color: context.colors.stroke.primary,
            indent: AppSpacing.s16,
            endIndent: AppSpacing.s16,
          ),
          _InfoRow(label: 'Email', value: user.email),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s16,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: context.styles.bodyM.copyWith(
              color: context.colors.text.subtle,
            ),
          ),
          const SizedBox(height: AppSpacing.s4),
          Text(
            value,
            style: context.styles.bodyL.semibold,
          ),
        ],
      ),
    );
  }
}
