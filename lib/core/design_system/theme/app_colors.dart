import 'package:flutter/material.dart';

import '../tokens/app_palette.dart';

/// Semantic colour tokens, grouped exactly like the Figma style guide:
/// `text`, `bg`, `stroke`, `button` and `state`.
///
/// Registered as a [ThemeExtension] so widgets read the correct set for the
/// active brightness via `context.colors` (e.g. `context.colors.text.header`).
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.text,
    required this.bg,
    required this.stroke,
    required this.button,
    required this.state,
  });

  final TextColors text;
  final BgColors bg;
  final StrokeColors stroke;
  final ButtonColors button;
  final StateColors state;

  static const AppColors light = AppColors(
    text: TextColors(
      header: AppPalette.grey900,
      body: AppPalette.grey800,
      subtle: AppPalette.grey500,
      disabled: AppPalette.grey400,
      neutral: AppPalette.white,
    ),
    bg: BgColors(
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFFB0B0B0),
      tertiary: Color(0xFFE8E9ED),
      quaternary: Color(0xFFF8F8FA),
    ),
    stroke: StrokeColors(
      primary: Color(0xFFE5E5E5),
      secondary: Color(0xFFEDEDED),
    ),
    button: ButtonColors(
      primary: AppPalette.primaryBase,
      hoverActive: AppPalette.primaryDark,
      disabled: AppPalette.primaryLight,
      outline: AppPalette.primaryBase,
    ),
    state: StateColors._shared,
  );

  static const AppColors dark = AppColors(
    text: TextColors(
      header: AppPalette.white,
      body: AppPalette.grey100,
      subtle: AppPalette.grey400,
      disabled: AppPalette.grey500,
      neutral: AppPalette.white,
    ),
    bg: BgColors(
      primary: Color(0xFF0D0F11),
      secondary: Color(0xFF1A1C20),
      tertiary: Color(0xFF25282C),
      quaternary: Color(0xFF2C2F33),
    ),
    stroke: StrokeColors(
      primary: Color(0xFF394150),
      secondary: Color(0xFF394150),
    ),
    button: ButtonColors(
      primary: AppPalette.primaryBase,
      hoverActive: AppPalette.primaryBase2,
      disabled: AppPalette.primaryDarker,
      outline: AppPalette.primaryBase,
    ),
    state: StateColors._shared,
  );

  @override
  AppColors copyWith({
    TextColors? text,
    BgColors? bg,
    StrokeColors? stroke,
    ButtonColors? button,
    StateColors? state,
  }) {
    return AppColors(
      text: text ?? this.text,
      bg: bg ?? this.bg,
      stroke: stroke ?? this.stroke,
      button: button ?? this.button,
      state: state ?? this.state,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      text: text.lerp(other.text, t),
      bg: bg.lerp(other.bg, t),
      stroke: stroke.lerp(other.stroke, t),
      button: button.lerp(other.button, t),
      state: state.lerp(other.state, t),
    );
  }
}

/// Text colour tokens [text].
@immutable
class TextColors {
  const TextColors({
    required this.header,
    required this.body,
    required this.subtle,
    required this.disabled,
    required this.neutral,
  });

  final Color header;
  final Color body;
  final Color subtle;
  final Color disabled;

  /// Always white, e.g. text on filled buttons in either mode.
  final Color neutral;

  TextColors lerp(TextColors other, double t) {
    return TextColors(
      header: Color.lerp(header, other.header, t)!,
      body: Color.lerp(body, other.body, t)!,
      subtle: Color.lerp(subtle, other.subtle, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
    );
  }
}

/// Background colour tokens [bg].
@immutable
class BgColors {
  const BgColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.quaternary,
  });

  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color quaternary;

  BgColors lerp(BgColors other, double t) {
    return BgColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
    );
  }
}

/// Stroke / border colour tokens [stroke].
@immutable
class StrokeColors {
  const StrokeColors({required this.primary, required this.secondary});

  final Color primary;
  final Color secondary;

  StrokeColors lerp(StrokeColors other, double t) {
    return StrokeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }
}

/// Button colour tokens [button].
@immutable
class ButtonColors {
  const ButtonColors({
    required this.primary,
    required this.hoverActive,
    required this.disabled,
    required this.outline,
  });

  final Color primary;
  final Color hoverActive;
  final Color disabled;
  final Color outline;

  ButtonColors lerp(ButtonColors other, double t) {
    return ButtonColors(
      primary: Color.lerp(primary, other.primary, t)!,
      hoverActive: Color.lerp(hoverActive, other.hoverActive, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
    );
  }
}

/// State colour tokens [state] — identical in light and dark mode.
@immutable
class StateColors {
  const StateColors({
    required this.errorLight,
    required this.errorBase,
    required this.errorDark,
    required this.warningLight,
    required this.warningBase,
    required this.warningDark,
    required this.successLight,
    required this.successBase,
    required this.successDark,
  });

  static const StateColors _shared = StateColors(
    errorLight: AppPalette.errorLight,
    errorBase: AppPalette.errorBase,
    errorDark: AppPalette.errorDark,
    warningLight: AppPalette.warningLight,
    warningBase: AppPalette.warningBase,
    warningDark: AppPalette.warningDark,
    successLight: AppPalette.successLight,
    successBase: AppPalette.successBase,
    successDark: AppPalette.successDark,
  );

  final Color errorLight;
  final Color errorBase;
  final Color errorDark;
  final Color warningLight;
  final Color warningBase;
  final Color warningDark;
  final Color successLight;
  final Color successBase;
  final Color successDark;

  StateColors lerp(StateColors other, double t) {
    return StateColors(
      errorLight: Color.lerp(errorLight, other.errorLight, t)!,
      errorBase: Color.lerp(errorBase, other.errorBase, t)!,
      errorDark: Color.lerp(errorDark, other.errorDark, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
      warningBase: Color.lerp(warningBase, other.warningBase, t)!,
      warningDark: Color.lerp(warningDark, other.warningDark, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      successBase: Color.lerp(successBase, other.successBase, t)!,
      successDark: Color.lerp(successDark, other.successDark, t)!,
    );
  }
}
