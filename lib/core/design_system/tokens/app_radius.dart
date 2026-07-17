import 'package:flutter/widgets.dart';

/// Corner radius tokens.
///
/// Raw values are named by size (`r12` = 12px from Figma); the prebuilt
/// [BorderRadius] constants cover the common all-corners case:
/// `borderRadius: AppRadius.br12`.
abstract final class AppRadius {
  static const double r4 = 4;
  static const double r6 = 6;
  static const double r8 = 8;
  static const double r12 = 12;
  static const double r16 = 16;
  static const double r24 = 24;

  /// Fully rounded (pills, avatars).
  static const double rFull = 999;

  static const BorderRadius br4 = BorderRadius.all(Radius.circular(r4));
  static const BorderRadius br6 = BorderRadius.all(Radius.circular(r6));
  static const BorderRadius br8 = BorderRadius.all(Radius.circular(r8));
  static const BorderRadius br12 = BorderRadius.all(Radius.circular(r12));
  static const BorderRadius br16 = BorderRadius.all(Radius.circular(r16));
  static const BorderRadius br24 = BorderRadius.all(Radius.circular(r24));
  static const BorderRadius brFull = BorderRadius.all(Radius.circular(rFull));
}
