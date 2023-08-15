// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/events_time_microapp_ds.dart';
import 'package:flutter/material.dart';

enum DSPhaseButtonStyle {
  // OUTLINED,
  MILKED,
  // OUTLINED_MILKED,
}

enum DSPhaseButtonSize { SMALL }

enum DSPhaseButtonState {
  INITIAL,
  IN_PROGRESS,
  DONE_WITH_SUCCESS,
  DONE_WITH_ERROR,
}

class DSPhaseButtonTheme {
  final Color? color;
  final LinearGradient? gradientColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? inProgressColor;

  final Color? successColor;
  final Color? successTextColor;

  final Color? errorColor;
  final Color? errorTextColor;

  final Color? pressedColor;
  final Color? pressedTextColor;
  final Color? pressedBorderColor;

  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? disabledBorderColor;

  final Color? indicatorColor;
  final Color? indicatorBackgroundColor;

  final double? borderWidth;
  final double? borderRadius;

  final double? strokeWidth;
  final double? minHeight;
  final double? minWidth;

  final EdgeInsetsGeometry? padding;

  DSPhaseButtonTheme({
    this.color,
    this.gradientColor,
    this.textColor,
    this.borderColor,
    this.inProgressColor,
    this.successColor,
    this.successTextColor,
    this.errorColor,
    this.errorTextColor,
    this.pressedColor,
    this.pressedTextColor,
    this.pressedBorderColor,
    this.disabledColor,
    this.disabledTextColor,
    this.disabledBorderColor,
    this.indicatorColor,
    this.indicatorBackgroundColor,
    this.borderWidth,
    this.borderRadius,
    this.strokeWidth,
    this.minHeight,
    this.minWidth,
    this.padding,
  });

  DSPhaseButtonTheme copyWithOverride(DSPhaseButtonTheme? themeOverride) {
    return DSPhaseButtonTheme(
      color: themeOverride?.color ?? color,
      gradientColor: themeOverride?.gradientColor ?? gradientColor,
      textColor: themeOverride?.textColor ?? textColor,
      borderColor: themeOverride?.borderColor ?? borderColor,
      inProgressColor: themeOverride?.inProgressColor ?? inProgressColor,
      successColor: themeOverride?.successColor ?? successColor,
      successTextColor: themeOverride?.successTextColor ?? successTextColor,
      errorColor: themeOverride?.errorColor ?? errorColor,
      errorTextColor: themeOverride?.errorTextColor ?? errorTextColor,
      pressedColor: themeOverride?.pressedColor ?? pressedColor,
      pressedTextColor: themeOverride?.pressedTextColor ?? pressedTextColor,
      pressedBorderColor:
          themeOverride?.pressedBorderColor ?? pressedBorderColor,
      disabledColor: themeOverride?.disabledColor ?? disabledColor,
      disabledTextColor: themeOverride?.disabledTextColor ?? disabledTextColor,
      disabledBorderColor:
          themeOverride?.disabledBorderColor ?? disabledBorderColor,
      indicatorColor: themeOverride?.indicatorColor ?? indicatorColor,
      indicatorBackgroundColor:
          themeOverride?.indicatorBackgroundColor ?? indicatorBackgroundColor,
      borderWidth: themeOverride?.borderWidth ?? borderWidth,
      borderRadius: themeOverride?.borderRadius ?? borderRadius,
      strokeWidth: themeOverride?.strokeWidth ?? strokeWidth,
      minHeight: themeOverride?.minHeight ?? minHeight,
      minWidth: themeOverride?.minWidth ?? minWidth,
      padding: themeOverride?.padding ?? padding,
    );
  }
}

final DSPhaseButtonTheme phaseButtonThemeDefault = DSPhaseButtonTheme(
  color: DSColors.primary.base,
  inProgressColor: DSColors.primary.dark,
  successColor: DSColors.success.base,
  successTextColor: DSColors.neutral.s100,
  errorColor: DSColors.error.base,
  errorTextColor: DSColors.neutral.s100,
  textColor: DSColors.neutral.s100,
  borderColor: DSColors.primary.base,
  pressedColor: DSColors.primary.dark,
  pressedTextColor: DSColors.neutral.s100,
  pressedBorderColor: DSColors.primary.dark,
  disabledColor: DSColors.neutral.s72,
  disabledTextColor: DSColors.neutral.s100,
  disabledBorderColor: Colors.transparent,
  borderWidth: 0,
  borderRadius: 400,
  minHeight: kbuttonMinHeight,
  minWidth: double.infinity,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  strokeWidth: 2,
  indicatorColor: DSColors.neutral.s100,
  indicatorBackgroundColor: DSColors.primary.base,
);

final DSPhaseButtonTheme phaseButtonThemeStyleMilked = DSPhaseButtonTheme(
  color: DSColors.neutral.s100,
  disabledColor: DSColors.primary.light,
  disabledTextColor: DSColors.neutral.s100,
  textColor: DSColors.primary.base,
  indicatorColor: DSColors.primary.dark,
  indicatorBackgroundColor: DSColors.primary.light,
);

final DSPhaseButtonTheme phaseButtonThemeStyleSmall = DSPhaseButtonTheme(
  minHeight: 48,
);
