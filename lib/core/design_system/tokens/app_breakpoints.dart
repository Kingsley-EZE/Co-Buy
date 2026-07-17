/// Layout breakpoints (logical pixels, screen width).
///
/// Three classes are enough for this app: phone, tablet, desktop/web.
/// Query them through the context helpers (`context.isMobile`,
/// `context.responsive(...)`) rather than comparing widths inline.
abstract final class AppBreakpoints {
  /// Below this the layout is phone-sized.
  static const double tablet = 600;

  /// At or above this the layout is desktop-sized.
  static const double desktop = 1024;
}
