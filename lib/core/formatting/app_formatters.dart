/// Display formatters shared across screens, mirroring [AppValidators]:
/// pure static functions with no widget or state dependencies.
class AppFormatters {
  const AppFormatters._();

  /// ₦ with thousands grouping, dropping the decimals when whole
  /// (450000 → ₦450,000; 499.5 → ₦499.50).
  static String naira(double amount) {
    final bool isWhole = amount == amount.truncateToDouble();
    final String text = isWhole
        ? amount.toInt().toString()
        : amount.toStringAsFixed(2);
    final int dot = text.indexOf('.');
    final String intPart = dot == -1 ? text : text.substring(0, dot);
    final String decimals = dot == -1 ? '' : text.substring(dot);
    final String grouped = intPart.replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (_) => ',',
    );
    return '₦$grouped$decimals';
  }

  static const List<String> _weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  static const List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  /// Coarse relative time for activity feeds: `just now`, `5 minutes ago`,
  /// `2 hours ago`, `3 days ago`.
  static String timeAgo(DateTime dateTime) {
    final Duration since = DateTime.now().difference(dateTime);
    if (since.inMinutes < 1) return 'just now';
    if (since.inHours < 1) {
      final m = since.inMinutes;
      return m == 1 ? '1 minute ago' : '$m minutes ago';
    }
    if (since.inDays < 1) {
      final h = since.inHours;
      return h == 1 ? '1 hour ago' : '$h hours ago';
    }
    final d = since.inDays;
    return d == 1 ? '1 day ago' : '$d days ago';
  }

  /// Compact deadline display: `Sun. 20 July 6pm` (minutes only when
  /// non-zero: `Sun. 20 July 6:30pm`).
  static String deadline(DateTime dateTime) {
    final int hour12 = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final String period = dateTime.hour < 12 ? 'am' : 'pm';
    final String minutes = dateTime.minute == 0
        ? ''
        : ':${dateTime.minute.toString().padLeft(2, '0')}';
    return '${_weekdays[dateTime.weekday - 1]}. ${dateTime.day} '
        '${_months[dateTime.month - 1]} $hour12$minutes$period';
  }
}
