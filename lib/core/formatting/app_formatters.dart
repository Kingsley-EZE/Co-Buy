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
}
