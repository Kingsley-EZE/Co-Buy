import 'package:co_buy/core/components/atoms/notification_badge.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class DashboardNavBar extends StatelessWidget {
  const DashboardNavBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onCreatePool,
    this.alertsBadgeCount = 0,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onCreatePool;

  /// Unread notifications, shown as a badge on the Alerts tab.
  final int alertsBadgeCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.bg.primary,
        border: Border(top: BorderSide(color: colors.stroke.secondary)),
      ),
      child: SafeArea(
        top: false,
        // The scaffold hands the bar loose height constraints, so every child
        // must shrink-wrap; the tallest tab sets the bar height and the
        // fixed-size centre button rides vertically centred against it.
        child: Row(
          children: [
            _NavTab(
              icon: Assets.icons.icNavHome,
              label: 'Home',
              selected: currentIndex == 0,
              onTap: () => onTabSelected(0),
            ),
            _NavTab(
              icon: Assets.icons.icNavPools,
              label: 'My pools',
              selected: currentIndex == 1,
              onTap: () => onTabSelected(1),
            ),
            _CreatePoolButton(onTap: onCreatePool),
            _NavTab(
              icon: Assets.icons.icNavAlert,
              label: 'Alerts',
              selected: currentIndex == 2,
              badgeCount: alertsBadgeCount,
              onTap: () => onTabSelected(2),
            ),
            _NavTab(
              icon: Assets.icons.icNavProfile,
              label: 'Profile',
              selected: currentIndex == 3,
              onTap: () => onTabSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  const _NavTab({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.badgeCount = 0,
  });

  final SvgGenImage icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final int badgeCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final Color tint = selected ? colors.button.primary : colors.text.header;

    return Expanded(
      child: Semantics(
        selected: selected,
        button: true,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 3,
                width: 56,
                decoration: BoxDecoration(
                  color: selected ? colors.button.primary : null,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(AppRadius.r4),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.s12),
              NotificationBadge(
                count: badgeCount,
                child: icon.svg(
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
                ),
              ),
              const SizedBox(height: AppSpacing.s4),
              Text(
                label,
                style: context.styles.bodyM.medium.copyWith(color: tint),
              ),
              const SizedBox(height: AppSpacing.s8),
            ],
          ),
        ),
      ),
    );
  }
}

class _CreatePoolButton extends StatelessWidget {
  const _CreatePoolButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s8),
      child: Material(
        color: colors.button.primary,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox.square(
            dimension: AppSpacing.s56,
            child: Icon(Icons.add, color: colors.text.neutral, size: 28),
          ),
        ),
      ),
    );
  }
}
