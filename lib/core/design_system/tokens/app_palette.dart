import 'dart:ui';

/// Primitive colour tokens from the Figma style guide (Foundations > Colour).
///
/// These are raw, theme-agnostic values. Widgets should almost always use the
/// semantic roles on `AppColors` (via `context.colors`) instead, so that light
/// and dark mode resolve automatically. Reach for the palette only when a
/// value must stay fixed regardless of theme (e.g. a brand splash screen).
abstract final class AppPalette {
  // Primary [primary]
  static const Color primaryDarker = Color(0xFF1D076E);
  static const Color primaryDark = Color(0xFF4012C5);
  static const Color primaryBase = Color(0xFF6232FF);
  static const Color primaryBase2 = Color(0xFF9080FF);
  static const Color primaryLight = Color(0xFFD4D2FF);
  static const Color primaryLighter = Color(0xFFF2F2FF);

  // Greys
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey900 = Color(0xFF111216);
  static const Color grey800 = Color(0xFF333436);
  static const Color grey500 = Color(0xFF7D7F81);
  static const Color grey400 = Color(0xFFB0B3B5);
  static const Color grey100 = Color(0xFFF2F2F2);

  // State [state]
  static const Color errorLight = Color(0xFFFEEFF2);
  static const Color errorBase = Color(0xFFF04438);
  static const Color errorDark = Color(0xFFB42318);
  static const Color warningLight = Color(0xFFFFF6E0);
  static const Color warningBase = Color(0xFFF7900A);
  static const Color warningDark = Color(0xFFB54708);
  static const Color successLight = Color(0xFFE7FEF8);
  static const Color successBase = Color(0xFF2FB769);
  static const Color successDark = Color(0xFF1B7647);
}
