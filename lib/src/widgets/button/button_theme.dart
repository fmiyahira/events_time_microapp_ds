// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/src/common/colors/colors.dart';
import 'package:flutter/material.dart';

enum DSButtonStyle {
  PRIMARY,
  SECONDARY,
  OUTLINED,
  MILKED,
  OUTLINED_MILKED,
  SECONDARY_MILKED,
  LINK,
}

enum DSButtonSize { SMALL, MICRO }

class DSButtonTheme {
  final Color? color;
  final LinearGradient? gradientColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? pressedColor;
  final Color? pressedTextColor;
  final Color? pressedBorderColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? disabledBorderColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? minHeight;
  final double? minWidth;
  final EdgeInsets? padding;

  const DSButtonTheme({
    this.color,
    this.gradientColor,
    this.textColor,
    this.borderColor,
    this.pressedColor,
    this.pressedTextColor,
    this.pressedBorderColor,
    this.disabledColor,
    this.disabledTextColor,
    this.disabledBorderColor,
    this.borderWidth,
    this.borderRadius,
    this.minHeight,
    this.minWidth,
    this.padding,
  });

  DSButtonTheme copyWithOverride(DSButtonTheme? buttonThemeOverride) {
    return DSButtonTheme(
      color: buttonThemeOverride?.color ?? color,
      gradientColor: buttonThemeOverride?.gradientColor ?? gradientColor,
      textColor: buttonThemeOverride?.textColor ?? textColor,
      borderColor: buttonThemeOverride?.borderColor ?? borderColor,
      pressedColor: buttonThemeOverride?.pressedColor ?? pressedColor,
      pressedTextColor:
          buttonThemeOverride?.pressedTextColor ?? pressedTextColor,
      pressedBorderColor:
          buttonThemeOverride?.pressedBorderColor ?? pressedBorderColor,
      disabledColor: buttonThemeOverride?.disabledColor ?? disabledColor,
      disabledTextColor:
          buttonThemeOverride?.disabledTextColor ?? disabledTextColor,
      disabledBorderColor:
          buttonThemeOverride?.disabledBorderColor ?? disabledBorderColor,
      borderWidth: buttonThemeOverride?.borderWidth ?? borderWidth,
      borderRadius: buttonThemeOverride?.borderRadius ?? borderRadius,
      minHeight: buttonThemeOverride?.minHeight ?? minHeight,
      minWidth: buttonThemeOverride?.minWidth ?? minWidth,
      padding: buttonThemeOverride?.padding ?? padding,
    );
  }
}

final DSButtonTheme buttonThemeDefault = DSButtonTheme(
  color: DSColors.primary.base,
  borderColor: DSColors.primary.base,
  borderRadius: 400,
  borderWidth: 0,
  disabledBorderColor: Colors.transparent,
  disabledColor: DSColors.neutral.s88,
  disabledTextColor: DSColors.neutral.s100,
  minHeight: 56.0,
  minWidth: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  pressedBorderColor: DSColors.primary.darker,
  pressedColor: DSColors.primary.darker,
  pressedTextColor: DSColors.neutral.s100,
  textColor: DSColors.neutral.s100,
);

final DSButtonTheme buttonThemePrimary = DSButtonTheme(
  color: DSColors.primary.base,
  textColor: DSColors.neutral.s100,
  borderColor: DSColors.primary.base,
  disabledColor: DSColors.neutral.s88,
  disabledTextColor: DSColors.neutral.s100,
);

final DSButtonTheme buttonThemeSecondary = DSButtonTheme(
  color: DSColors.primary.lighter,
  textColor: DSColors.primary.darker,
  borderColor: DSColors.primary.lighter,
  disabledColor: DSColors.neutral.s96,
  disabledTextColor: DSColors.neutral.s72,
);

final DSButtonTheme buttonThemeOutlined = DSButtonTheme(
  color: Colors.transparent,
  textColor: DSColors.primary.base,
  borderColor: DSColors.primary.light,
  pressedColor: DSColors.primary.dark,
  pressedBorderColor: DSColors.primary.dark,
  disabledColor: Colors.transparent,
  disabledTextColor: DSColors.neutral.s72,
  disabledBorderColor: DSColors.neutral.s88,
  borderWidth: 1,
);

final DSButtonTheme buttonThemeMilked = DSButtonTheme(
  color: DSColors.neutral.s100,
  textColor: DSColors.primary.base,
  borderColor: DSColors.neutral.s100,
  disabledColor: DSColors.neutral.s100.withOpacity(0.24),
  disabledTextColor: DSColors.neutral.s72,
);

final DSButtonTheme buttonThemeSecondaryMilked = DSButtonTheme(
  color: DSColors.neutral.s100.withOpacity(0.40),
  textColor: DSColors.neutral.s100,
  borderColor: DSColors.neutral.s100.withOpacity(0.40),
  disabledColor: DSColors.neutral.s100.withOpacity(0.32),
  disabledTextColor: DSColors.neutral.s100.withOpacity(0.24),
);

final DSButtonTheme buttonThemeOutlinedMilked = DSButtonTheme(
  color: Colors.transparent,
  textColor: DSColors.neutral.s100,
  borderColor: DSColors.neutral.s100,
  pressedColor: DSColors.primary.dark,
  pressedBorderColor: DSColors.primary.dark,
  disabledColor: Colors.transparent,
  disabledTextColor: DSColors.neutral.s100.withOpacity(0.24),
  disabledBorderColor: DSColors.neutral.s100.withOpacity(0.40),
  borderWidth: 1,
);

final DSButtonTheme buttonThemeLink = DSButtonTheme(
  color: Colors.transparent,
  borderColor: Colors.transparent,
  textColor: DSColors.primary.base,
  pressedTextColor: DSColors.primary.base,
  pressedColor: Colors.transparent,
  disabledColor: Colors.transparent,
  disabledTextColor: DSColors.neutral.s72,
  padding: EdgeInsets.zero,
);

const DSButtonTheme buttonThemeSmall = DSButtonTheme(
  minHeight: 44.0,
);

const DSButtonTheme buttonThemeMicro = DSButtonTheme(
  minWidth: double.minPositive,
  minHeight: 40.0,
  padding: EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  ),
);
