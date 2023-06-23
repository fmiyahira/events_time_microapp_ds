// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:events_time_microapp_ds/src/common/colors/colors.dart';
import 'package:flutter/material.dart';

enum DSInteractiveTextStyle { MILKED }

enum DSInteractiveTextType { ACTION, ACTION_SMALL }

class DSInteractiveTextTheme {
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? lineHeight;
  final double? letterSpacing;
  final Color? textColor;
  final Color? disabledTextColor;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const DSInteractiveTextTheme({
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.lineHeight,
    this.letterSpacing,
    this.textColor,
    this.disabledTextColor,
    this.textAlign,
    this.textDecoration,
  });

  DSInteractiveTextTheme copyWithOverride(
      DSInteractiveTextTheme? interactiveTextThemeOverride) {
    return DSInteractiveTextTheme(
      fontSize: interactiveTextThemeOverride?.fontSize ?? fontSize,
      fontWeight: interactiveTextThemeOverride?.fontWeight ?? fontWeight,
      fontStyle: interactiveTextThemeOverride?.fontStyle ?? fontStyle,
      lineHeight: interactiveTextThemeOverride?.lineHeight ?? lineHeight,
      letterSpacing:
          interactiveTextThemeOverride?.letterSpacing ?? letterSpacing,
      textColor: interactiveTextThemeOverride?.textColor ?? textColor,
      disabledTextColor:
          interactiveTextThemeOverride?.disabledTextColor ?? disabledTextColor,
      textAlign: interactiveTextThemeOverride?.textAlign ?? textAlign,
      textDecoration:
          interactiveTextThemeOverride?.textDecoration ?? textDecoration,
    );
  }
}

final DSInteractiveTextTheme interactiveTextThemeDefault =
    DSInteractiveTextTheme(
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
  fontWeight: FontWeight.w600,
  fontStyle: FontStyle.normal,
  textAlign: TextAlign.start,
  textColor: DSColors.primary.base,
  disabledTextColor: DSColors.neutral.s46,
);

final DSInteractiveTextTheme interactiveTextThemeMilked =
    DSInteractiveTextTheme(
  textColor: DSColors.neutral.s100,
  disabledTextColor: DSColors.neutral.s100.withOpacity(0.4),
);

const DSInteractiveTextTheme interactiveTextThemeAction =
    DSInteractiveTextTheme(
  fontSize: 16,
  lineHeight: 1.5,
  letterSpacing: -0.2,
);

const DSInteractiveTextTheme interactiveTextThemeActionSmall =
    DSInteractiveTextTheme(
  fontSize: 14,
  lineHeight: 1.42,
  letterSpacing: -0.2,
);
