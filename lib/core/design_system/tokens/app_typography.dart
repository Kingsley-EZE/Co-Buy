import 'package:flutter/material.dart';

/// Type scale tokens from the Figma style guide (Foundations > Typography).
///
/// Figma defines each level in Semibold / Medium / Regular. Instead of one
/// constant per combination, headings default to Semibold and body styles to
/// Regular; switch weight with the `TextStyleX` extension, e.g.
/// `AppTypography.bodyLarge.semibold` or `AppTypography.heading3.regular`.
///
/// NOTE: Heading 1 (40px) and Heading 6 (18px) are confirmed by Figma labels;
/// heading 2-5 sizes are close estimates measured from the style-guide
/// screenshot — adjust here if the Figma values differ.
abstract final class AppTypography {
  static const String fontFamily = 'InstrumentSans';

  static const TextStyle _heading = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    height: 1.2,
  );

  static const TextStyle _body = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // Headings (Semibold by default)
  static final TextStyle heading1 = _heading.copyWith(fontSize: 40);
  static final TextStyle heading2 = _heading.copyWith(fontSize: 34);
  static final TextStyle heading3 = _heading.copyWith(fontSize: 28);
  static final TextStyle heading4 = _heading.copyWith(fontSize: 24);
  static final TextStyle heading5 = _heading.copyWith(fontSize: 22);
  static final TextStyle heading6 = _heading.copyWith(fontSize: 18);

  // Body (Regular by default)
  static final TextStyle bodyXLarge = _body.copyWith(fontSize: 18);
  static final TextStyle bodyLarge = _body.copyWith(fontSize: 16);
  static final TextStyle bodyMedium = _body.copyWith(fontSize: 14);
  static final TextStyle bodySmall = _body.copyWith(fontSize: 12);
}

/// Weight variants matching the Figma type-scale columns.
extension TextStyleX on TextStyle {
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
}
