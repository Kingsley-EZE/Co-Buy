import 'package:flutter/material.dart';

import '../tokens/app_palette.dart';
import '../tokens/app_typography.dart';
import 'app_colors.dart';

/// Builds the light and dark [ThemeData] for the app.
///
/// Semantic tokens live on [AppColors] (a [ThemeExtension]); this class maps
/// the most important ones onto Material's [ColorScheme] so built-in widgets
/// (dialogs, pickers, progress indicators, ...) pick up the brand too.
abstract final class AppTheme {
  static ThemeData get light => _build(Brightness.light, AppColors.light);

  static ThemeData get dark => _build(Brightness.dark, AppColors.dark);

  static ThemeData _build(Brightness brightness, AppColors colors) {
    final ColorScheme colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppPalette.primaryBase,
          brightness: brightness,
        ).copyWith(
          primary: AppPalette.primaryBase,
          onPrimary: colors.text.neutral,
          error: colors.state.errorBase,
          surface: colors.bg.primary,
          onSurface: colors.text.body,
          outline: colors.stroke.primary,
          outlineVariant: colors.stroke.secondary,
        );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      fontFamily: AppTypography.fontFamily,
      textTheme: _textTheme(colors),
      scaffoldBackgroundColor: colors.bg.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.bg.primary,
        foregroundColor: colors.text.header,
        elevation: 0,
        // Keep the bar flat when content scrolls under it (no M3 tint).
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: AppTypography.heading6.copyWith(
          color: colors.text.header,
        ),
        iconTheme: IconThemeData(color: colors.text.header),
      ),
      dividerColor: colors.stroke.primary,
      disabledColor: colors.text.disabled,
      extensions: <ThemeExtension<dynamic>>[colors],
    );
  }

  /// Maps the Figma type scale onto Material [TextTheme] roles:
  /// display/headline/title ← Heading 1-6, body ← Body Large/Medium/Small,
  /// label ← Medium-weight body (buttons, chips, captions).
  ///
  /// Prefer `context.textTheme` in widgets; use [AppTypography] directly (with
  /// `.semibold`/`.medium`/`.regular`) when a design calls for a specific
  /// size/weight combination outside these defaults.
  static TextTheme _textTheme(AppColors colors) {
    final Color header = colors.text.header;
    final Color body = colors.text.body;

    return TextTheme(
      displayLarge: AppTypography.heading1.copyWith(color: header),
      displayMedium: AppTypography.heading2.copyWith(color: header),
      displaySmall: AppTypography.heading3.copyWith(color: header),
      headlineMedium: AppTypography.heading4.copyWith(color: header),
      headlineSmall: AppTypography.heading5.copyWith(color: header),
      titleLarge: AppTypography.heading6.copyWith(color: header),
      titleMedium: AppTypography.bodyXLarge.semibold.copyWith(color: header),
      titleSmall: AppTypography.bodyLarge.semibold.copyWith(color: header),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: body),
      bodyMedium: AppTypography.bodyMedium.copyWith(color: body),
      bodySmall: AppTypography.bodySmall.copyWith(color: body),
      labelLarge: AppTypography.bodyLarge.medium.copyWith(color: body),
      labelMedium: AppTypography.bodyMedium.medium.copyWith(color: body),
      labelSmall: AppTypography.bodySmall.medium.copyWith(color: body),
    );
  }
}
