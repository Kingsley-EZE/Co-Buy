import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../tokens/app_breakpoints.dart';

/// Design-system shortcuts on [BuildContext].
extension DesignSystemContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  /// Semantic colours for the active brightness, e.g.
  /// `context.colors.text.header` or `context.colors.bg.quaternary`.
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Type scale under its Figma names, e.g. `Body/L/regular` ->
  /// `context.styles.bodyL` and `Heading/2/Medium` -> `context.styles.h2.medium`.
  AppTextStyles get styles => AppTextStyles(colors);

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => screenWidth < AppBreakpoints.tablet;

  bool get isTablet =>
      screenWidth >= AppBreakpoints.tablet &&
      screenWidth < AppBreakpoints.desktop;

  bool get isDesktop => screenWidth >= AppBreakpoints.desktop;

  /// Picks a value per breakpoint, falling back to the next-smaller class,
  /// e.g. `crossAxisCount: context.responsive(mobile: 2, desktop: 4)`.
  T responsive<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }
}
