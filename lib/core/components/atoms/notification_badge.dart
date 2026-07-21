import 'package:co_buy/core/design_system/design_system.dart';
import 'package:flutter/material.dart';

/// A count bubble for unread items, styled with the error token so it reads as
/// an attention marker. Wraps [child] and overlays the badge at its top-end
/// corner; renders [child] unchanged when [count] is zero so callers can pass
/// it unconditionally without their own visibility checks.
class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    super.key,
    required this.count,
    required this.child,
  });

  final int count;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return child;

    final colors = context.colors;
    return Badge(
      backgroundColor: colors.state.errorBase,
      textColor: colors.text.neutral,
      label: Text(count > 99 ? '99+' : '$count'),
      child: child,
    );
  }
}
