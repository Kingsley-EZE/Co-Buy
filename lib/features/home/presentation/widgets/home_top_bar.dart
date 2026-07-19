import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/auth/domain/entities/user.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

/// Greeting header for the home tab: initials avatar, time-of-day greeting
/// with the user's first name, and a notification bell.
class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key, this.user, required this.onNotificationTap});

  /// Null while no session user is available (e.g. a deep link straight into
  /// the dashboard); the bar then greets without a name.
  final User? user;

  final VoidCallback onNotificationTap;

  static String _greeting(int hour) => switch (hour) {
    < 12 => 'Good Morning',
    < 17 => 'Good Afternoon',
    _ => 'Good Evening',
  };

  @override
  Widget build(BuildContext context) {
    final firstName = user?.firstName;

    return Row(
      children: [
        _InitialsAvatar(user: user),
        const SizedBox(width: AppSpacing.s16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_greeting(DateTime.now().hour), style: context.styles.h5),
              const SizedBox(height: AppSpacing.s2),
              Text(
                firstName == null || firstName.isEmpty
                    ? 'Hi there.'
                    : 'Hi, $firstName.',
                style: context.styles.bodyL,
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.s16),
        _BellButton(onTap: onNotificationTap),
      ],
    );
  }
}

/// Brand-tinted circle with the user's initials. The tints stay fixed across
/// themes so the avatar reads as brand, not surface.
class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({required this.user});

  final User? user;

  String get _initials {
    final first = user?.firstName ?? '';
    final last = user?.lastName ?? '';
    return '${first.isEmpty ? '' : first[0]}${last.isEmpty ? '' : last[0]}'
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.s56,
      height: AppSpacing.s56,
      decoration: const BoxDecoration(
        color: AppPalette.primaryLighter,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        _initials,
        style: context.styles.h5.medium.copyWith(color: AppPalette.primaryBase),
      ),
    );
  }
}

class _BellButton extends StatelessWidget {
  const _BellButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Material(
      color: Colors.transparent,
      shape: CircleBorder(side: BorderSide(color: colors.stroke.primary)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox.square(
          dimension: AppSpacing.s48,
          child: Center(
            child: Assets.icons.icNotification.svg(
              width: AppSpacing.s24,
              height: AppSpacing.s24,
              colorFilter: ColorFilter.mode(
                colors.text.header,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
