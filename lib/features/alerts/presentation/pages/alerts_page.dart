import 'package:co_buy/core/components/scaffolds/app_scaffold.dart';
import 'package:co_buy/core/design_system/design_system.dart';
import 'package:co_buy/features/alerts/domain/entities/app_notification.dart';
import 'package:co_buy/features/alerts/presentation/blocs/notifications_bloc/notifications_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Reads the app-wide [NotificationsBloc] provided by the dashboard shell —
/// which also owns fetching, the socket, and clearing the unread badge on
/// entry — so this page is a pure renderer of the shared list.
class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: const Text('Alerts')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenH,
              AppSpacing.s20,
              AppSpacing.screenH,
              AppSpacing.s8,
            ),
            child: Text(
              'Stay updated on your pools and activities.',
              style: context.styles.bodyL.copyWith(
                color: context.colors.text.subtle,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<NotificationsBloc, NotificationsState>(
              builder: (context, state) => switch (state.status) {
                NotificationsStatus.initial || NotificationsStatus.loading =>
                  const Center(child: CircularProgressIndicator()),
                NotificationsStatus.failure => Center(
                  child: Text(
                    state.error ?? 'Something went wrong',
                    style: context.styles.bodyL.copyWith(
                      color: context.colors.text.subtle,
                    ),
                  ),
                ),
                NotificationsStatus.success =>
                  state.notifications.isEmpty
                      ? Center(
                          child: Text(
                            'No notifications yet',
                            style: context.styles.bodyL.copyWith(
                              color: context.colors.text.subtle,
                            ),
                          ),
                        )
                      : _NotificationList(notifications: state.notifications),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationList extends StatelessWidget {
  const _NotificationList({required this.notifications});

  final List<AppNotification> notifications;

  List<Object> _buildItems() {
    final groups = <String, List<AppNotification>>{};
    for (final n in notifications) {
      final label = _sectionLabel(n.createdAt);
      groups.putIfAbsent(label, () => []).add(n);
    }
    return [
      for (final entry in groups.entries) ...[entry.key, ...entry.value],
    ];
  }

  static String _sectionLabel(DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final local = createdAt.toLocal();
    final d = DateTime(local.year, local.month, local.day);

    if (d == today) return 'TODAY';
    if (d == today.subtract(const Duration(days: 1))) return 'YESTERDAY';

    const months = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC',
    ];
    const weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    return '${weekdays[d.weekday - 1]}, ${months[d.month - 1]} ${d.day}';
  }

  @override
  Widget build(BuildContext context) {
    final items = _buildItems();
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: AppSpacing.s24),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        if (item is String) return _SectionHeader(label: item);
        return _NotificationTile(notification: item as AppNotification);
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.screenH,
        AppSpacing.s24,
        AppSpacing.screenH,
        AppSpacing.s8,
      ),
      child: Text(
        label,
        style: context.styles.bodyS.semibold.copyWith(
          color: context.colors.text.subtle,
          letterSpacing: 0.8,
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.screenH,
        vertical: AppSpacing.s12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: context.colors.bg.tertiary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_active,
              size: AppSpacing.s24,
              color: context.colors.text.subtle,
            ),
          ),
          const SizedBox(width: AppSpacing.s12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: context.styles.bodyM.copyWith(fontWeight: .w600),
                ),
                const SizedBox(height: AppSpacing.s4),
                Text(
                  notification.message,
                  style: context.styles.bodyS.copyWith(
                    color: context.colors.text.subtle,
                  ),
                ),
                const SizedBox(height: AppSpacing.s4),
                Text(
                  _formatTimestamp(notification.createdAt),
                  style: context.styles.bodyS.copyWith(
                    color: context.colors.text.subtle,
                    fontWeight: .w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static String _formatTimestamp(DateTime createdAt) {
    final local = createdAt.toLocal();
    final now = DateTime.now();
    final diff = now.difference(local);

    if (diff.inMinutes < 1) return 'Just now';

    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(local.year, local.month, local.day);

    if (d == today) {
      final h = local.hour == 0
          ? 12
          : local.hour > 12
          ? local.hour - 12
          : local.hour;
      final min = local.minute.toString().padLeft(2, '0');
      final period = local.hour < 12 ? 'am' : 'pm';
      return '$h:$min$period';
    }

    if (diff.inHours < 48) return '${diff.inHours} hours ago';
    return '${diff.inDays} days ago';
  }
}
