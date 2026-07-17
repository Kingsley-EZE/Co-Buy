import 'package:flutter/material.dart';

import '../tokens/app_typography.dart';
import 'app_colors.dart';

/// Figma-named access to the type scale, so a style read off the Figma
/// inspect panel translates 1:1 to code without checking `app_theme.dart`:
///
/// | Figma name           | Code                             |
/// |----------------------|----------------------------------|
/// | `Heading/1/Semibold` | `context.styles.h1`              |
/// | `Heading/4/Medium`   | `context.styles.h4.medium`       |
/// | `Body/XL/semibold`   | `context.styles.bodyXl.semibold` |
/// | `Body/L/regular`     | `context.styles.bodyL`           |
/// | `Body/M/medium`      | `context.styles.bodyM.medium`    |
/// | `Body/S/regular`     | `context.styles.bodyS`           |
///
/// Headings default to Semibold and carry the `text.header` colour; body
/// styles default to Regular with the `text.body` colour. Recolour with the
/// semantic tokens when the design differs, e.g.
/// `context.styles.bodyM.copyWith(color: context.colors.text.subtle)`.
///
/// The Material `context.textTheme` roles remain available for widgets that
/// consume them implicitly (AppBar titles, buttons, ...); both are built from
/// the same [AppTypography] tokens, so they never disagree.
class AppTextStyles {
  const AppTextStyles(this._colors);

  final AppColors _colors;

  TextStyle _heading(TextStyle style) =>
      style.copyWith(color: _colors.text.header);

  TextStyle _body(TextStyle style) => style.copyWith(color: _colors.text.body);

  TextStyle get h1 => _heading(AppTypography.heading1);

  TextStyle get h2 => _heading(AppTypography.heading2);

  TextStyle get h3 => _heading(AppTypography.heading3);

  TextStyle get h4 => _heading(AppTypography.heading4);

  TextStyle get h5 => _heading(AppTypography.heading5);

  TextStyle get h6 => _heading(AppTypography.heading6);

  TextStyle get bodyXl => _body(AppTypography.bodyXLarge);

  TextStyle get bodyL => _body(AppTypography.bodyLarge);

  TextStyle get bodyM => _body(AppTypography.bodyMedium);

  TextStyle get bodyS => _body(AppTypography.bodySmall);
}
