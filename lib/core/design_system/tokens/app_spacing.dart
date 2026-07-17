/// Spacing tokens on a 4px grid.
///
/// Named by value so a padding read off Figma translates directly:
/// 16px in the inspect panel -> `AppSpacing.s16`. Using the tokens (rather
/// than raw doubles) keeps layouts on the grid and makes off-grid values
/// stand out in review.
abstract final class AppSpacing {
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s8 = 8;
  static const double s12 = 12;
  static const double s16 = 16;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s32 = 32;
  static const double s40 = 40;
  static const double s48 = 48;
  static const double s56 = 56;
  static const double s64 = 64;

  /// Default horizontal padding for screen content.
  static const double screenH = s16;
}
